workoutcard.rb
==============

This is a tool to generate LaTeX-based workout logging cards. The format in which the exercises are specified can be learned by looking at the examples lower.workout
and upper.workout.

It is not very well written but does the job well. I only released it, because other people might find it useful and I have no intent to maintain or improve the code.

Example
-------

1. Specifu your Workout

```
$ cat lower.workout
```
```ruby
{ :year      => 2014,
  :title     => "Upper Body Workout",
  :exercises => [[{ :name => "Bench Press",
                   :variant => "Dumbbells", 
                   :sets => 3, :reps => 8 },
                 { :name => "Seated Rows",
                   :variant => "Lever",
                   :sets => 3, :reps => 8 },
                 { :name => "Fly",
                   :variant => "Pec Deck",
                   :sets => 3, :reps => 8 },
                 { :name => "Cable Pulldown",
                   :variant => "Close Grip",
                   :sets => 3, :reps => 8 }],
                [{ :name => "Military Press",
                   :variant => "Barbell",
                   :sets => 3, :reps => 8 },
                 { :name => "Upright Row",
                   :variant => "Barbell",
                   :sets => 3, :reps => 8 },
                 { :name => "Preacher Curl",
                   :variant => "EZ-Bar",
                   :sets => 3, :reps => 8 },
                 { :name => "Triceps Extension",
                   :variant => "Dumbbell",
                   :sets => 3, :reps => 8 },
                 { :name => "Shrug",
                   :variant => "Dumbbell",
                   :sets => 3, :reps => 8 }]] }
```

2. Build the LaTeX-Source

```
$ ./workoutcard.rb lower.workout > lower.tex
```

3. Compile it

```
$ pdflatex lower.tex
```

4. Print it

```
lpr lower.pdf
```

Dependencies
------------

- Ruby 2.1
- LaTeX, including packages:
    - textcomp
    - geometry
    - array
    - realboxes
    - xfrac
