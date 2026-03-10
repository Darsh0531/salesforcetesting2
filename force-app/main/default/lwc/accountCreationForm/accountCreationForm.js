import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { NavigationMixin } from 'lightning/navigation';

export default class AccountCreationForm extends NavigationMixin(LightningElement) {
    
    handleSuccess(event) {
        const createdAccount = event.detail;
        
        // Show success toast
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Success',
                message: `Account "${createdAccount.fields.Name.value}" was created successfully!`,
                variant: 'success'
            })
        );
        
        // Navigate to the newly created account record
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: createdAccount.id,
                objectApiName: 'Account',
                actionName: 'view'
            }
        });
    }
    
    handleError(event) {
        const error = event.detail;
        
        // Show error toast
        this.dispatchEvent(
            new ShowToastEvent({
                title: 'Error Creating Account',
                message: error.body.message || 'An unknown error occurred',
                variant: 'error'
            })
        );
    }
    
    handleReset() {
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if (inputFields) {
            inputFields.forEach(field => {
                field.reset();
            });
        }
    }
}
