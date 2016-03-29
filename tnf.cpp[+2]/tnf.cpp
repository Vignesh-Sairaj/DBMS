#include <iostream>
#include <string>
#include <map>
#include <bits/stdc++.h>

using namespace std;

map<char,int> prime;

//Counts the number of prime attributes in the given string
int count(string s) {
	int c = 0;
	for(int i=0; i < s.length(); i++) {
		if(prime[s[i]] != 0) {
			c++;
		}
	}
	return c;
}

bool isPrime(string s) {
	bool flag = false;
	for(int i=0; i<s.length(); i++) {
		if(prime[s[i]] == 0)
			flag = true;
	}
	return flag;
}

int main()
{
	
	cout<<"Enter the number of attributes : ";
	int numAttributes, numPrimeAttributes, numFD;
	cin >> numAttributes;
	char currAttrib[numAttributes];
	cout << "Enter number of prime attributes : ";
	cin >> numPrimeAttributes;
	cout << "Enter the attributes and 1 for prime  : \n";
	string attribStr;
	for(int i=0;i<numAttributes;i++) {
		cin >> currAttrib[i];
		attribStr = attribStr+currAttrib[i];
		cin >> prime[currAttrib[i]];
	}
	/*
	cout<<"\nmapping fn :\numAttributes";
	for(int i=0; i<numAttributes; i++) 
	{
		cout<<currAttrib[i]<<"->"<<prime[currAttrib[i]]<<endl;
	}
	*/
	cout << "Enter the number of fds: ";
	cin >> numFD;
	string lhs[numFD], rhs[numFD];
	cout << "Enter the FDs with lhs and rhs seperated by a space: \n";
	
	for(int i=0; i<numFD; i++) { //READ FDs
		cin>>lhs[i]>>rhs[i];
	}
	
	cout<<"List of FDs: ";
	for(int i=0; i < numFD; i++) {
		cout<<lhs[i]<<"->"<<rhs[i]<<endl;
	}
	
	bool flag = true;
	int pos[] ={0};
	
	for(int i=0; i < numFD; i++) {
		if(count(rhs[i]) == 0) { //NPA check
			
			if( isPrime(lhs[i]) )
				continue;
			
			if(count(lhs[i]) != numPrimeAttributes) { //smaller subset
				flag = false;
				pos[i] = 1;
			}
		}
	}
	
	cout << "Relations formed:  \n" ;
		
	for(int i=0; i < numFD; i++)  { //for each FD
		
		if(pos[i] == 1) { //If there is a violation
			
			cout<< lhs[i] + rhs[i] <<endl;
				
			for(int j=0; j < rhs[i].length(); j++) {
				//int p=attribStr.find(rhs[i][j]);
			//	cout<<"test"<<endl;
			//	attribStr.erase(p,p+1);
				attribStr.erase(remove(attribStr.begin(),attribStr.end(),rhs[i][j]),attribStr.end());
			}
		}
		//	else
		//		cout<<lhs[i]+rhs[i]<<endl;
	}
	
	cout << attribStr << endl;
	
	if(flag == false) {
		cout<<"The given relation is not in 2nd normal form";
	}
	
	else {
		cout<<"The given relation is in 2nd normal form\n ";
	}
	return 0;
}
