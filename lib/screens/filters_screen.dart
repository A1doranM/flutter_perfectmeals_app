import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function onFilterSelected;
  final Map<String, bool> filters;

  FiltersScreen({@required this.onFilterSelected, @required this.filters});

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.filters['gluten'];
    _vegetarian = widget.filters['lactose'];
    _vegan = widget.filters['vegetarian'];
    _lactoseFree = widget.filters['vegan'];
    super.initState();
  }

  Widget _buildSwitchListTile({
    @required String title,
    String description,
    @required bool currentValue,
    @required Function updateValue,
  }) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final Map<String, bool> _filters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.onFilterSelected(_filters);
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your mel selection.',
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                    title: 'Gluten free',
                    description: 'Only include gluten free meals.',
                    currentValue: _glutenFree,
                    updateValue: (bool value) {
                      setState(() {
                        _glutenFree = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Lactose free',
                    description: 'Only include lactose free meals.',
                    currentValue: _lactoseFree,
                    updateValue: (bool value) {
                      setState(() {
                        _lactoseFree = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegetarian',
                    description: 'Only include vegetarian meals.',
                    currentValue: _vegetarian,
                    updateValue: (bool value) {
                      setState(() {
                        _vegetarian = value;
                      });
                    }),
                _buildSwitchListTile(
                    title: 'Vegan',
                    description: 'Only include vegan meals.',
                    currentValue: _vegan,
                    updateValue: (bool value) {
                      setState(() {
                        _vegan = value;
                      });
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
