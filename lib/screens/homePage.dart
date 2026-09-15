import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../providers/postProvider.dart';
import '../providers/categoryProvider.dart';
import '../widgets/postCard.dart';
import '../widgets/categoryFilter.dart';
import '../widgets/emptyState.dart';
import '../widgets/errorState.dart';
import '../widgets/shimmerpostCard.dart';
import '../widgets/bannerSlider.dart';
import 'postdetailPage.dart';
import 'searchPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    if (!mounted) return;

    await context.read<CategoryProvider>().loadCategories();

    if (!mounted) return;

    await context.read<PostProvider>().loadAllPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),

      appBar: AppBar(
        title: const Text('Blog App'),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SearchPage(),
                ),
              );
            },
          ),
        ],
      ),

      body: CustomRefreshIndicator(
        onRefresh: _loadData,

        builder: (context, child, controller) {
          return AnimatedBuilder(
            animation: controller,

            builder: (context, _) {
              return Stack(
                children: [
                  Transform.translate(
                    offset: Offset(
                      0,
                      controller.value * 80,
                    ),
                    child: child,
                  ),

                  if (controller.isDragging ||
                      controller.isArmed)
                    Positioned(
                      top: controller.value * 40,
                      left: 0,
                      right: 0,

                      child: Center(
                        child: Container(
                          padding: const EdgeInsets.all(12),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                              ),
                            ],
                          ),

                          child: controller.isArmed
                              ? const Icon(
                                  Icons.refresh,
                                  color: Colors.green,
                                )
                              : SizedBox(
                                  width: 24,
                                  height: 24,
                                  child:
                                      CircularProgressIndicator(
                                    value: controller.value,
                                    strokeWidth: 2,
                                    color: Colors.green,
                                  ),
                                ),
                        ),
                      ),
                    ),
                ],
              );
            },
          );
        },

        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),

          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start,

            children: [
        
              Consumer<PostProvider>(
                builder: (context, provider, child) {
                  // Jangan tampilkan banner saat loading
                  // pertama kali
                  if (provider.isLoading &&
                      provider.posts.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  // Jangan tampilkan jika tidak ada post
                  if (provider.posts.isEmpty) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding:
                        const EdgeInsets.only(top: 12),
                    child: BannerSlider(
                      posts: provider.posts,
                    ),
                  );
                },
              ),
              
                const CategoryFilter(),

              const SizedBox(height: 16),

              Consumer<PostProvider>(
                builder: (context, provider, child) {
                  // Loading
                  if (provider.isLoading &&
                      provider.posts.isEmpty) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: 4,

                      itemBuilder: (_, __) =>
                          const ShimmerPostCard(),
                    );
                  }

                  // Error
                  if (provider.errorMessage != null &&
                      provider.posts.isEmpty) {
                    return ErrorState(
                      message: provider.errorMessage!,
                      onRetry: _loadData,
                    );
                  }

                  // Empty
                  if (provider.posts.isEmpty) {
                    return EmptyState(
                      icon: Icons.article_outlined,
                      title: 'Belum ada postingan',
                      subtitle:
                          'Jadilah yang pertama untuk membagikan cerita!',
                      onRetry: _loadData,
                    );
                  }

                  // Posts
                  return AnimationLimiter(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(16),
                      itemCount: provider.posts.length,

                      itemBuilder: (context, index) {
                        final post =
                            provider.posts[index];

                        return AnimationConfiguration
                            .staggeredList(
                          position: index,
                          duration: const Duration(
                            milliseconds: 500,
                          ),

                          child: SlideAnimation(
                            verticalOffset: 50.0,

                            child: FadeInAnimation(
                              child: PostCard(
                                post: post,

                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          PostDetailPage(
                                        post: post,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}