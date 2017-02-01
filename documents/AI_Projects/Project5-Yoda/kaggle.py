from numpy import loadtxt
from numpy import array as nparray
from sklearn.preprocessing import OneHotEncoder
from sklearn.ensemble import GradientBoostingRegressor

#===================================================
# Globals
#===================================================
inputfile = "train.csv"
catcols = range(1, 117) # Categorical columns range
numcols = 132

dataset = None
totalrows = 0

trainingsize = 20000
X = []
Y = []
Xtest = []
Ytest = []

enc = None
clf = None
clf_iterations = 100

lossfile = "loss.txt"

#===================================================
# Functions
#===================================================
def conv(x):
    """ Convert string into numerical """
    if type(x) is str:
        result = 0
        for y in x:
            result *= 27
            result += (ord(y) - ord('A')) + 1
        return result
    if type(x) is bytes:
        result = 0
        for y in x:
            result *= 27
            result += (y - ord('A')) + 1
        return result
    return float(x)

def load_data(filename):
    # Column converter dictionary for numpy
    dconv = {}
    for i in catcols:
        dconv[i] = conv

    # Load the CSV file as a numpy matrix
    print("Loading data ... ")
    dataset = loadtxt(filename,
                         dtype='float',
                         delimiter=",",
                         skiprows=1,
                         converters=dconv)
    print("Data loaded (read " + str(len(dataset[:,0])) + " rows)")
    return dataset

def do_data_split():
    global totalrows, X, Y, Xtest, Ytest
    """ Break the input into training and test """
    totalrows = len(dataset[:,0])
    X = dataset[:trainingsize,0:131]
    Y = dataset[:trainingsize,131]
    Xtest = dataset[trainingsize:,0:131]
    Ytest = dataset[trainingsize:,131]

def prepare_encoder():
    global dataset, enc

    """ Prepare the encoder to convert categorical columns to numbers """
    print("Preparing encoder ...")
    domains = []
    for i in range(numcols):
        if i not in catcols: domains.append(None)
        else: domains.append(list(set(dataset[:,i])))
    repdata = []
    rowid = 0
    while True:
        row = [0] * numcols
        addrow = False
        for j in catcols:
            dom = domains[j]
            if rowid < len(dom):
                row[j] = dom[rowid]
                addrow = True
            else:
                row[j] = repdata[0][j]
        if addrow:
            repdata.append(row)
            rowid += 1
        else: break
    repdata = nparray(repdata)
    enc = OneHotEncoder(categorical_features=catcols, sparse=False)
    enc.fit(repdata)
    print("Encoder prepared.")

def train_model():
    global X, Y, clf, enc

    print("Beginning training ...")
    print("Transforming training data ...")
    tdata = enc.transform(X)
    print("Training data transformed into " + str(len(tdata[0,:])) + " columns.")
    clf = GradientBoostingRegressor(n_estimators = clf_iterations, verbose = 1, max_depth = 1)
    clf.fit(tdata, Y)
    print("Training complete!")

def test_model():
    with open(lossfile, "wt") as floss:
        print("Initiating testing of model ...")

        def mae(y1, y2):
            total = 0;
            r = 0
            for i in range(len(y1)):
                r += abs(y1[i] - y2[i])
                total += 1
            r /= total
            return r

        def chunks(total, part):
            for i in range(0, total, part):
                yield (i, min(total, i + part))

        totalchunks = 0
        msum = 0
        for ci, cr in enumerate(chunks(len(Xtest[:,0]), 1000)):
            batchdata = Xtest[cr[0]:cr[1],:]

            # transforming batch data
            tdata = enc.transform(batchdata)

            # running classifier
            Ypred = clf.predict(tdata)
            Yreal = Ytest[cr[0]:cr[1]]

            # write pairs to file
            for i in range(len(Yreal)):
                floss.write("{0}, {1}\n".format(batchdata[i,0], Ypred[i] - Yreal[i]))

            # mean absolute error
            m = mae(Ypred, Yreal)
            print("Chunk #{0}: MAE = {1}".format(ci, m))

            msum += m
            totalchunks += 1

        msum /= totalchunks
        floss.write("MAE = {0}".format(msum))
        return msum

def main():
    global dataset
    dataset = load_data(inputfile)
    do_data_split()
    prepare_encoder()
    train_model()
    result = test_model()
    print("Result MAE = {0}".format(result))

#===================================================
# Executable Script
#===================================================
if __name__ == "__main__":
    main()
