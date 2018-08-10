class Recipe {
  String title,
      image,
      writer = 'Chef Leon',
      description =
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum id neque libero. Donec finibus sem viverra, luctus nisi ac, semper enim. Vestibulum in mi feugiat, mattis erat suscipit, fermentum quam. Mauris non urna sed odio congue rhoncus. \nAliquam a dignissim ex. Suspendisse et sem porta, consequat dui et, placerat tortor. Sed elementum nunc a blandit euismod. Cras condimentum faucibus dolor. Etiam interdum egestas sagittis. Aliquam vitae molestie eros. Cras porta felis ac eros pellentesque, sed lobortis mi eleifend. Praesent ut.';
  int id, time, yield;
  double rating;

  Recipe(this.id, this.title, this.image, this.time, this.yield, this.rating);
}

final List<Recipe> recipies = [
  Recipe(1, 'Roasted Raw Vegetables', 'res/recipies/1.PNG', 105, 2, 3.5),
  Recipe(2, 'Salad Tuna Nicoise with Mallorca mini Potatoes', 'res/recipies/2.PNG', 45, 2, 4.0)
];
