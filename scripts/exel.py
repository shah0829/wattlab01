import os
import pandas as pd
import argparse


def save_file(in_data1, in_data2, filename):
    filename1 = "%s_ADH.csv" % filename
    filename2 = "%s_ALP.csv" % filename
    in_data1.to_csv(filename1, header=True)
    in_data2.to_csv(filename2, header=True)


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--path", required=True, help="Path to file")

    arguments = parser.parse_args()

    files2open = os.listdir(path=arguments.path)

    for file in files2open:
        # read csv file here

        fileo = os.path.join(arguments.path, file)
        data = pd.read_csv(fileo)
        data_df = pd.DataFrame(data)
        # select the column of data A D and H
        data_ADH = data_df.iloc[:, [0, 3, 7]]
        # select the column of data A L and P
        data_ALP = data_df.iloc[:, [0, 11, 15]]
        base = os.path.basename(fileo)
        filename = os.path.splitext(base)
        save_file(data_ADH, data_ALP, filename)
