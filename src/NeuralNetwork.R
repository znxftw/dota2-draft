# Artificial Neural Network implementation

# Uncomment the following lines if you dont already have the packages
# install.packages('caTools')
# install.packages('h2o')

library(h2o)
library(caTools)

# Importing the dataset
dataset = read.csv('dotaMatch.csv')
dataset = dataset[2:123]

# Splitting the dataset into the Training set and Test set
split = sample.split(dataset$Result, SplitRatio = 0.9)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling the Duration
training_set[1] = scale(training_set[1])
test_set[1] = scale(test_set[1])

# Fitting ANN to the Training set
h2o.init(nthreads = -1)
model = h2o.deeplearning(y = 'Result',
                         training_frame = as.h2o(training_set),
                         activation = 'Rectifier',
                         hidden = c(100,100),
                         epochs = 1000,
                         train_samples_per_iteration = -2)

# Predicting the Test set results
y_pred = h2o.predict(model, newdata = as.h2o(test_set[-122]))
y_pred = ifelse(y_pred > 0 , 1 , -1)
y_pred = as.vector(y_pred)

# Making the Confusion Matrix
cm = table(test_set[, 122], y_pred)