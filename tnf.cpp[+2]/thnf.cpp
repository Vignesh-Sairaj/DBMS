#include <iostream>
#include <string>
#include <map>
#include <bits/stdc++.h>

using namespace std;

map<char,int> prime;

int count(string s) {
	int c = 0;
	for(int i=0;i<s.length();i++) {
		if(prime[s[i]] != 0) {
			c++;
		}
	}
	return c;
}

bool match(string s, string e)
{
	bool isMatch[] = {false};
	bool flag = true;
	for(int i=0; i < s.length(); i++) {
		for(int j=0; j < e.length(); j++) {
			if(s[i] == e[j])
		  		isMatch[i] = true;
		}
	}

	for(int i=0; i < s.length(); i++) {
		if(isMatch[i] == false)
			flag = false;
	}

	return flag;
}

int main() {

	cout<<"Enter the number of attributes : ";
	string attribStr;
	int numAttributes, numPrimeAttributes, numFD;
	cin >> numAttributes;
	char currAttrib[numAttributes];
	cout << "Enter the number of prime attributes : ";
	cin >> numPrimeAttributes;
	cout<<"Enter the attributes followed by 1 for prime  :\n";

	for(int i=0; i<numAttributes; i++) {

		cin>>currAttrib[i];
		attribStr = attribStr + currAttrib[i];
		cin >> prime[currAttrib[i]];

	}

	/*cout<<"\nmapping fn :\numAttributes";
	for(int i=0;i<numAttributes;i++) {

		cout<<currAttrib[i]<<"->"<<prime[currAttrib[i]]<<endl;
	}*/

	cout << "Enter the number of fds: ";
	cin >> numFD;
	string lhs[numFD], rhs[numFD];

	for(int i=0;i<numFD;i++) {
		cin >> lhs[i] >> rhs[i];
	}

	cout<<"List of FDs: \n";
	for(int i=0; i<numFD; i++) {
		cout<<lhs[i]<<"->"<<rhs[i]<<endl;
	}

	bool isViolatingFD[] = {false};
	bool is3NF = false;
	for(int i=0; i<numFD; i++) {
		if(count(rhs[i]) != 0) {
			continue;
		}

		for(int j=0;j<numFD;j++) {
			if(i!=j) {
				 //Compare the lhs and rhs. 'i' will cause the violation if any
				//cout<<" t2 "<<t2<<endl;
				if(match(lhs[i], rhs[i]))
				{
					is3NF = true;
					isViolatingFD[i] = true;
				}
			}
		}
	}

    cout << "Relations formed:  \n" ;
	for(int i=0;i<numFD;i++) {
		if(isViolatingFD[i]) {
			cout << lhs[i] + rhs[i] << endl;
			for(int j=0; j < rhs[i].length(); j++) { //remove the offending fds
				attribStr.erase(remove(attribStr.begin(),attribStr.end(),rhs[i][j]),attribStr.end());
			}
		}
	}

	cout << attribStr << endl;

	if(!is3NF)
		cout << "The given relation is not in third normal form\n";
	else
		cout << "The given relation is not in third normal form\n";

	return 0;
}
