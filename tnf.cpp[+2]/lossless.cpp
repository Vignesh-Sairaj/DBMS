#include <bits/stdc++.h>
using namespace std;


int no_of_relations=10;
int no_of_attributes=10;
int no_of_fds=10;
int dmatrix[10][10];

int  fd(int no_of_fds){
    for(int i=1;i<=no_of_fds;i++){
        int lhs,rhs ;
		cout<<"\n-------------enter the "<<i<<"th fd--------------\n";
        cout<<"\n enter the no of attributes in lhs:";
        cin>>lhs;
        cout<<"\n enter the no of attributes in rhs:";
        cin>>rhs;

	    int lhsarr[lhs];
        int rhsarr[rhs];

	cout<<"\nenter lhs:";
        for(int i=1;i<=lhs;i++)
            cin>>lhsarr[i];
	cout<<"\nenter rhs:";
        for(int i=1;i<=rhs;i++)
            cin>>rhsarr[i];
     cout<<"\nFD :";
     for(int i=1;i<=lhs;i++)
     	cout<<lhsarr[i];
     	cout<<"------>";
     for(int i=1;i<=rhs;i++)
     	cout<<rhsarr[i];
     	cout<<endl;

       int check_count_l[lhs]; //Check if lhs attr is present in the relation
       
       for(int z=1;z<=lhs;z++){ //init 
           check_count_l[z]=0;
       }
       
       if(lhs==1) { //if no elts = 1
    	 cout<<"\n checking for lhs validity \n";
    	 
    	 for(int i=1;i<=no_of_relations;i++) {
        		for(int j=1;j<=lhs;j++) {
	        		if(dmatrix[i][lhsarr[j]]) {
        			    check_count_l[j]=check_count_l[j]+1;
    	    		}
        		}
        	}
       }
       
       if(lhs>1) {
       	int remember_for_lhs_validity[no_of_relations];
       	
    	cout<<"\n checking for lhs validity \n";
    	for(int i=1;i<=no_of_relations;i++){ {
	        		if(dmatrix[i][lhsarr[1]]){
						remember_for_lhs_validity[i]=i;
        				check_count_l[1]=check_count_l[1]+1;
    	    		}
        		}
        	}
        	int w=2;
        for(int i=1;i<=no_of_relations;i++){
        	for(int j=2;j<=lhs;j++){
        		if(i==remember_for_lhs_validity[w]){
        			if(dmatrix[i][lhsarr[j]]){
        				check_count_l[j]=check_count_l[j]+1;
        			}
        		}
        	}
        }
      }


        cout<<"\ndisplaying  check_count_l\n";
        for(int k=1;k<=lhs;k++)
        cout<<check_count_l[k];

        int lhs_check=1;
        for(int i=0;i<=lhs;i++){
        	if(check_count_l[i]<=1)
        		lhs_check=0;
        }
        if(lhs_check==1){
        	cout<<"\nlhs is valid \n";
        }
        else
        	cout<<"\nlhs is not valid \n";
	if(lhs_check==1)
	{
		int remember_relations[no_of_relations];
		int not_to_remember[no_of_relations];
		int k=1;
		int t=1;
		for(int i=1;i<=no_of_relations;i++ ){
			for(int j=1;j<=lhs;j++){
				if(!dmatrix[i][lhsarr[j]]==1){
					not_to_remember[k]=i;
					k++;
					continue;
				}

			}
		}

		cout<<"\nNOT to rememered relations \n";
			for(int l=1;l<k;l++)
				cout<<not_to_remember[l];
		cout<<endl;

		int z=1;

		for(int i=1;i<=no_of_attributes;i++)
		{

			if(i!=not_to_remember[z]){
				for(int j=1;j<=rhs;j++)
				{
				dmatrix[i][rhsarr[j]]=1;
				}
				z++;
			}
		}
	}

  for(int i=1;i<=no_of_relations;i++){
  		int flag=1;
		for(int j=1;j<=no_of_attributes;j++){
			cout<<dmatrix[i][j];
			if(!dmatrix[i][j]==1){
				flag=0;
			}
		}
		cout<<"\n";
		if(flag==1){
			cout<<"\nsuccess...already in lossless join\n";
			return 1;
		}
	}
}
return 0;
}

int main() {
    cout<<"\nenter the no_of_attributes:";
    cin>>no_of_attributes;
    cout<<"\n no_of_relations:";
    cin>>no_of_relations;
    
    for(int i=1;i<=no_of_relations;i++){
        for(int j=1;j<=no_of_attributes;j++){
            dmatrix[i][j]=0;
        }
    }
    for(int i=1;i<=no_of_relations;i++){
        for(int j=1;j<=no_of_attributes;j++){
            int ans;
            cout<<"\nrelation:"<<i<<" attribute:"<<j<<" (press 1 if exists):";
            cin>>ans;
            dmatrix[i][j]=ans;
           // cout<<"matrix i="<<i<<" j="<<j<<"="<<dmatrix[i][j];
        }
    }
    cout<<"\n";
    for(int i=1;i<=no_of_relations;i++){
        for (int j=1;j<=no_of_attributes;j++) {
            cout<<dmatrix[i][j]<<" ";
        }
    
        cout<<"\n";
    }
    
    
    cout<<"\n enter the no_of_fds: ";
    cin>>no_of_fds;
    
    fd(no_of_fds);
    
    return 0;

}