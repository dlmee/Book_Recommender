# Book_Recommender
INFO 523 Final Project

Final Project

November 29, 2022

#### 1. Link

[Link to Demo Video](https://youtu.be/4EQkGFV8qso)

#### 2 Title

Book Recommender: Using Feature Selection and Matrix Factorization

#### 3 Group Members

I worked solo on this project. However, I enjoyed the immense amount of support that the Internet provides. Thanks to all the experts on Stack Overflow. Thanks to untold amount of users who offer help on various other platforms.  Thanks to [Denise Chen](https://towardsdatascience.com/recommendation-system-matrix-factorization-d61978660b4b), whom I've never met, but helped me translate math to code.

#### 4 Github Repository

https://github.com/dlmee/Book_Recommender

#### 5 Summary of my talk

For my project I built a book recommender system. To accomplish this I took data from [Kaggle.com](https://www.kaggle.com/datasets/arashnic/book-recommendation-dataset?select=Users.csv). The data is real world data from book reviews, and the goal I wanted to accomplish was to create a book recommendation system. I feel that I accomplished my goal, though I could certainly point to other points for further improvement, such as normalization, and checking best practices on implementing feature selection and interacting between items and users for final recommendation. 

One primary goal I had for myself was to steep myself in R in order to become more competent in coding in this language. This happened, with many hours of 'how do you' typed in my Google search bar. The background is I encountered the topic of Matrix Factorization in my day job, in which I need to explain it to my students, and I thought I should work out a full solution on my own. I'm glad I did. It cleared up some misconceptions I had on the topic, as well as clarifying how matrix factorization accomplishes latent features using gradient descent--fascinating stuff!

Finally I had to explore various methods of feature selection in order to make my goals computationally feasible. I discovered quite quickly that a dataframe of a million observations with hundreds of thousands of variables (or the transposed) was not the way to go. Boiling features down was an exciting part of the project. 

The real world application is self-evident: putting the data in context, in order to give users meaningful recommendations for future choices. Predicting user desire is a clear goal-oriented data task. I also felt my discussion in my video would have benefited from a little more discussion on this relationship. To that end, I added a little [addendum](https://youtu.be/C4sjDvglRio). 
