import { createElement } from 'lwc';
import HelloConditionalRendering from 'c/helloConditionalRendering';

describe('c-hello-conditional-rendering', () => {
    afterEach(() => {
        // The jsdom instance is shared across test cases in a single file so reset the DOM
        while (document.body.firstChild) {
            document.body.removeChild(document.body.firstChild);
        }
    });

    it('is accessible when details are not visible', () => {
        const element = createElement('c-hello-conditional-rendering', {
            is: HelloConditionalRendering
        });
     
        document.body.appendChild(element);
     
        return Promise.resolve().then(() => expect(element).toBeAccessible());
    });

    it('is accessible when details are visible', () => {
        const element = createElement('c-hello-conditional-rendering', {
            is: HelloConditionalRendering
        });
     
        document.body.appendChild(element);
         
        // Emulate button click
        const buttonEl = element.shadowRoot.querySelector('button');
        buttonEl.click();
     
        return Promise.resolve().then(() => expect(element).toBeAccessible());
    });
    
});