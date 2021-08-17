import os
import pandas as pd
import argparse


def save_file(in_data, filename, cols):
    # filename1 = "%s_ADH.csv" % filename
    filename1 = filename_maker(filename, str(cols))
    # filename2 = "%s_ALP.csv" % filename
    # filename2 = filename_maker(filename)
    in_data.to_csv(filename1, header=True)
    # in_data2.to_csv(filename2, header=True)


def filename_maker(filename, cols):
    filename_full = "%s_set_%s.csv" % filename, cols
    return filename_full


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--path", required=True, help="Path to file")

    arguments = parser.parse_args()

    files2open = os.listdir(path=arguments.path)
    set_of_col = int(input("How many sets of column:"))
    for i in range(set_of_col):
        print(f"Enter the {i}th set col to select from the excel use , as separate:")
        col_set = input().split(",")
        for file in files2open:
            try:
                # read csv file here
                print("reading %s file for processing..." % file)
                fileo = os.path.join(arguments.path, file)
                data = pd.read_csv(fileo)
                data_df = pd.DataFrame(data)
                # select the column of data A D and H
                if len(data_df.columns) >= 15:
                    data_sel = data_df.iloc[:, col_set]
                    base = os.path.basename(fileo)
                    filename = os.path.splitext(base)
                    save_file(data_sel, filename, i)
                else:
                    print(f'File {file} doesnt contain columns set {i}')
            except:
                pass
