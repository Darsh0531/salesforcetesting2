import { LightningElement, track } from 'lwc';
import createAccount from '@salesforce/apex/QuickAccountController.createAccount';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class QuickAccountWizard extends LightningElement {
    @track message = '';
    @track selectedIndustry;
    
    industryOptions = [
        { label: 'Technology', value: 'Technology' },
        { label: 'Healthcare', value: 'Healthcare' },
        { label: 'Finance', value: 'Finance' },
        { label: 'Manufacturing', value: 'Manufacturing' },
        { label: 'Retail', value: 'Retail' },
        { label: 'Education', value: 'Education' },
        { label: 'Government', value: 'Government' },
        { label: 'Other', value: 'Other' }
    ];

    handleCreateApplication() {
        const nameInput = this.template.querySelector('[data-id="accName"]');
        const phoneInput = this.template.querySelector('[data-id="accPhone"]');
        const industryInput = this.template.querySelector('[data-id="accIndustry"]');
        const revenueInput = this.template.querySelector('[data-id="accRevenue"]');
        const numberInput = this.template.querySelector('[data-id="accNumber"]');
        const websiteInput = this.template.querySelector('[data-id="accWebsite"]');
        const employeesInput = this.template.querySelector('[data-id="accEmployees"]');
        const cityInput = this.template.querySelector('[data-id="accCity"]');
        
        // Get values
        const name = nameInput.value;
        const phone = phoneInput.value;
        const industry = this.selectedIndustry;
        const revenue = revenueInput.value;
        const accountNumber = numberInput.value;
        const website = websiteInput.value;
        const employees = employeesInput.value;
        const billingCity = cityInput.value;

        // Validate required fields
        if (!name) {
            nameInput.reportValidity();
            return;
        }

        if (!revenue) {
            revenueInput.reportValidity();
            return;
        }

        // Prepare account data
        const accountData = {
            name: name,
            phone: phone,
            industry: industry,
            annualRevenue: revenue ? parseFloat(revenue) : null,
            accountNumber: accountNumber,
            website: website,
            employees: employees ? parseInt(employees) : null,
            billingCity: billingCity
        };

        createAccount(accountData)
            .then(result => {
                this.message = `Account "${result.Name}" created successfully!`;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created successfully!',
                        variant: 'success'
                    })
                );
                // Clear all inputs
                this.clearForm();
            })
            .catch(error => {
                this.message = 'Error creating account';
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Error',
                        message: error.body.message,
                        variant: 'error'
                    })
                );
            });
    }

    clearForm() {
        const inputs = this.template.querySelectorAll('lightning-input, lightning-combobox');
        inputs.forEach(input => {
            if (input.tagName === 'LIGHTNING-COMBOBOX') {
                input.value = null;
            } else {
                input.value = '';
            }
        });
        this.selectedIndustry = null;
    }

    handleIndustryChange(event) {
        this.selectedIndustry = event.detail.value;
    }
}