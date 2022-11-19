/*
 * @Date: 2022-11-19
 * @Desc: 
 */
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_dev_utils/data/data.dart';

class ListWidget extends StatefulWidget {
  final String tabName;
  const ListWidget({super.key, required this.tabName});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  late List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();
    print(widget.tabName);
    // 请求数据
    switch (widget.tabName) {
      case '基础':
        data = BaseComponentData.getData();
        break;
      case '容器':
        data = ContainerComponentData.getData();
        break;
      default:
        data = [];
        break;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      // itemExtent: 17,
      padding: EdgeInsets.zero,
      children: data.map((item) => _buildItems(item)).toList(),
    );
  }

  Widget _buildItems(item) {
    return Container(
      child: Text('${item['name']}'),
    );
  }
}
