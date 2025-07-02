import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { ContactPageComponent } from './contact-page/ContactPageComponent';
import { editListingPageComponent } from './edit-list-page/editListingPageComponent';
import { ListingDetailsPageComponent } from './listings-detail-page/ListingDetailsPageComponent';
import { ListingsPageComponent } from './new-listing-page/MyListingPageComponent';
import { MyListingPageComponent } from './my-listing-page/MyListingPageComponent';

const routes: Routes = [
  { path: 'contact/:id', component: ContactPageComponent },
  { path: 'edit-listing/:id', component: MyListingPageComponent },
  { path: 'listing', component: ListingsPageComponent, pathMatch: 'full' },
  { path: 'listing/:id', component: ListingDetailsPageComponent },
  
  
  { path: 'my-listing/:id', component: EditListPageComponent },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
