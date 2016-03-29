import itertools as it


def createTable:
    attrib = set()
    num = int(raw_input("Enter number of attributes: "))

    for i in xrange(num):
        a = raw_input("Enter new attribute name: ")

        while a in attrib: #already entered
            a = raw_input("Enter new attribute name (not already entered): ")

        attrib.add(a)

    attrib = frozenset(attrib) #Changing type to frozen set

    subsets = [] #list of subsets
    for i in xrange(1, num):
        subsets.extend(list(it.combinations(attrib, i)))




    FDs = {}







class Table(object):
    def __init__(self):



