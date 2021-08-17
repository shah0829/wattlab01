import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv('data/AAexample_box_plot.csv')
data_df = pd.DataFrame(data)


# bar plot
def bar_plot(input_bar):
    ax = plt.Subplot()
    ax.bar(data_df.iloc[:, 0])



# box plot
def box_plot(input_box):
    pass


# violin plot
def violin_plot(input_viol):
    pass


# scatter plot
def scatter_plot(input_sc):
    pass
