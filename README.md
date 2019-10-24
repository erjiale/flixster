# Flix

Flix is an app that allows users to browse movies from the [The Movie Database API](http://docs.themoviedb.apiary.io/#).

## Flix Part 2

### User Stories

#### REQUIRED (10pts)
- [X] (5pts) User can tap a cell to see more details about a particular movie.
- [X] (5pts) User can tap a tab bar button to view a grid layout of Movie Posters using a CollectionView.

#### BONUS
- [X] (2pts) User can tap a poster in the collection view to see a detail screen of that movie.
- [ ] (2pts) In the detail view, when the user taps the poster, a new screen is presented modally where they can view the trailer.

### App Walkthough GIF
Here's a walkthrough of Flix Part 2:
<p><img src="http://g.recordit.co/543MreyDX2.gif" width=250></p>

GIF created with [Recordit] (https://recordit.co).

### Notes
I faced a problem with the collection view cell, which would not increase or decrease in size, and therefore, the image view inside it would always be tiny. I played around with the collection view properties, and then realized that the collection view was setting automatic sizes for its cells. As a consequence, even though I shrinked or increased the collection view cells, they would be set to 10 by 10 by the collection view property.

---

## Flix Part 1

Submitted by: Jiale Qiu

Time Spent: 3 hours spent in total

### User Stories

#### REQUIRED (10pts)
- [X] (2pts) User sees an app icon on the home screen and a styled launch screen.
- [X] (5pts) User can view and scroll through a list of movies now playing in theaters.
- [X] (3pts) User can view the movie poster image for each movie.

#### BONUS
- [X] (2pt) User can view the app on various device sizes and orientations.
- [ ] (1pt) Run your app on a real device.

### App Walkthough GIF
Here's a walkthrough of Flix Part 1 with different devices and device orientation:
<p>
  <img src="http://g.recordit.co/TgCZdUSio6.gif" width=250>
  <img src="https://recordit.co/DKJiF30NrT.gif" width=250>
</p>
<img src="http://g.recordit.co/vXGhQEL4m1.gif"> <br>

GIF created with [Recordit] (https://recordit.co).

### Notes
I had some trouble with leveraging Auto Layout as it would not work for bigger size screen iPhones such as iPhone 8 Plus, or iPhone 11 Pro, but managed to solve the problem caused by some vertical constraint conflicts.
