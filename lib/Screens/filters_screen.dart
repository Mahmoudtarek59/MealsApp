import 'package:flutter/material.dart';
import 'package:mealsapp/code/state_management.dart';
import 'package:mealsapp/widgets/drawer_widget.dart';
import 'package:provider/provider.dart';

class FiltersScreen extends StatefulWidget {
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void didChangeDependencies() {
    _glutenFree = Provider.of<StateManagement>(context).gluten;
    _vegan = Provider.of<StateManagement>(context).vegan;
    _vegetarian = Provider.of<StateManagement>(context).vegetarian;
    _lactoseFree = Provider.of<StateManagement>(context).lactose;
  }

  Widget _buildSwitchListTile({
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  }) {
    return SwitchListTile.adaptive(
      value: currentValue,
      title: Text(title),
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filters"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              Provider.of<StateManagement>(context, listen: false).setFilters(
                gluten: _glutenFree,
                lactose: _lactoseFree,
                vegan: _vegan,
                vegetarian: _vegetarian,
              );
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: DrawerWidget(),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                  currentValue: _glutenFree,
                  title: 'Gluten_free',
                  description: 'Only include gluten-free meals.',
                  updateValue: (val) => setState(() => _glutenFree = val),
                ),
                _buildSwitchListTile(
                  currentValue: _lactoseFree,
                  title: 'Lactose_free',
                  description: 'Only include lactose-free meals.',
                  updateValue: (val) => setState(() => _lactoseFree = val),
                ),
                _buildSwitchListTile(
                  currentValue: _vegetarian,
                  title: 'Vegetarian',
                  description: 'Only include vegetarian meals.',
                  updateValue: (val) => setState(() => _vegetarian = val),
                ),
                _buildSwitchListTile(
                  currentValue: _vegan,
                  title: 'Vegan',
                  description: 'Only include vegan meals.',
                  updateValue: (val) => setState(() => _vegan = val),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
