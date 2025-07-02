node -v  
npm -v  
mkdir 01-02
cd 01-02
npm install -g @angular/cli@9.1.9  
ng config --global analytics false  
ng new buy-and-sell  
Would you like to add Angular routing (y/N) 
Which stylesheet format would you like to use
Select CSS

cd buy-and-sell

// opens a new tab
ng serve -o

ng generate component listings-page

ng serve -o

Routing
ng generate component listings-page
/listing
/my-listing

add the listing component to route module and import 


ng generate component listings-detail-page
ng generate component contact-page
ng generate component my-listing-page
ng generate component new-listing-page
ng generate component edit-listing-page

