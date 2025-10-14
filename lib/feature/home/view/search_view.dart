import 'package:darcom_app/core/utils/app_images.dart';
import 'package:darcom_app/core/utils/app_padding.dart';
import 'package:darcom_app/core/utils/app_styles.dart';
import 'package:darcom_app/core/widgets/custom_appbar.dart';
import 'package:darcom_app/feature/home/view/widgets/products_grid_view.dart';
import 'package:darcom_app/feature/home/view/widgets/search_widget.dart';
import 'package:darcom_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String query = '';
  bool isSearching = false;

  final List<String> recentSearches = [
    'كنبة',
    'غرفة نوم',
    'طاولة طعام',
    'مكتب',
  ];

  final List<Map<String, dynamic>> searchResults = [
    {
      'id': 1,
      'name': 'كنبة عصرية فاخرة',
      'price': '12,500 \$',
      'image': Assets.imagesBedroomFurniture,
      'rating': 4.8,
      'discount': 'خصم 20%',
    },
    {
      'id': 2,
      'name': 'طقم غرفة نوم كامل',
      'price': '25,000 \$',
      'image': Assets.imagesBedroomFurniture,
      'rating': 4.9,
    },
  ];

  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void handleSearch(String text) {
    setState(() {
      query = text;
      isSearching = text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: S.of(context).search),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          SizedBox(height: 18.h),
          SearchWidget(onChanged: handleSearch, controller: _controller),
          const SizedBox(height: 10),
          Expanded(
            child: isSearching
                ? SearchResultsWidget(
                    results: searchResults,
                    label: S.of(context).SearchResults,
                    resultLabel: S.of(context).Result,
                  )
                : RecentSearchesWidget(
                    recentSearches: recentSearches,
                    onSelect: (s) {
                      _controller.text = s;
                      handleSearch(s);
                    },
                    title: S.of(context).Recentsearches,
                  ),
          ),
        ],
      ),
    );
  }
}

class RecentSearchesWidget extends StatelessWidget {
  final List<String> recentSearches;
  final Function(String) onSelect;
  final String title;

  const RecentSearchesWidget({
    super.key,
    required this.recentSearches,
    required this.onSelect,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.horizontal18,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyles.semiBold16),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              children: recentSearches
                  .map(
                    (s) => Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        onTap: () => onSelect(s),
                        leading: const Icon(Icons.access_time),
                        trailing: const Icon(Icons.close),
                        title: Text(s),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class SearchResultsWidget extends StatelessWidget {
  final List<Map<String, dynamic>> results;
  final String label;
  final String resultLabel;

  const SearchResultsWidget({
    super.key,
    required this.results,
    required this.label,
    required this.resultLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: AppPadding.horizontal18,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: AppStyles.semiBold16),
              Text(
                '${results.length} $resultLabel',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Expanded(child: ProductsGridView(products: results)),
      ],
    );
  }
}
