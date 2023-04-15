import 'package:flutter/material.dart';
import 'package:foodapp/dummy_data.dart';
import 'package:foodapp/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  static const detailMealScreen = '/detail-meal-screen';

  const MealDetailScreen({super.key});
  Widget buildSectionTitle(BuildContext context,String text) {
    return Container(
      margin: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10
      ),
      child: Text(
          text,
          style: Theme.of(context).textTheme.titleMedium
      ),
    );
  }


  Widget buildContainer(Widget child) {
    return Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey,width: 2),
            borderRadius: BorderRadius.circular(10)
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        child: child
    );
  }
  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title:  Text(selectedMeal.title),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context,'Ingredients'),
            buildContainer(
              ListView.builder(
              itemBuilder: (context,index)=> Card(
                  color: Theme.of(context).accentColor,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                    ),
                  )
              ),
              itemCount: selectedMeal.ingredients.length,
            ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              ListView.builder(
                itemBuilder: (context,index)=>  Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('# ${index +1}'),
                      ),
                      title: Text(selectedMeal.steps[index]),
                    ),
                    const Divider(
                      thickness: 2,
                    )
                  ],

                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.delete
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },

      ),
    );
  }

}
