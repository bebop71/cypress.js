describe('Покупка', function () {
    it('Карточка товара «БРОММС Двухместная кровать»' , function () {
        cy.clearCookies()
        cy.visit('https://testqastudio.me/');
        cy.get('.post-11342 > .product-inner > .product-summary > .woocommerce-loop-product__title > .woocommerce-LoopProduct-link').contains('БРОММС Двухместная кровать').should('be.visible', 'be.enabled').click();
        cy.get('.summary > .cart > .product-button-wrapper > .quantity > .increase').should('be.visible', 'be.enabled').click().click();
        cy.get('.summary > .cart > .product-button-wrapper').should('be.visible').type('3')
        cy.get('.summary > .cart > .product-button-wrapper > .single_add_to_cart_button').should('be.visible', 'be.enabled').click();
        cy.wait(6000)
        cy.get('.cart-panel-content > .modal-header > .modal-title').should('be.visible');
        cy.get('.mini-cart-item-11342 > .woocommerce-mini-cart-item__summary > .woocommerce-cart-item__qty > .remove > .name').should('be.visible', 'be.enabled');
        cy.get('.woocommerce-mini-cart__buttons > [href="https://sh3910517.c.had.su/cart/"]').should('be.visible', 'be.enabled').click();
        cy.get('#menu-top > .menu-item-home > a').should('be.visible', 'be.enabled').click();
        cy.get('.header-left-items > .site-branding > .logo > .logo-dark').should('be.visible', 'be.enabled').click();

        cy.visit('https://testqastudio.me/');
        cy.get('.post-11337 > .product-inner > .product-summary > .woocommerce-loop-product__title > .woocommerce-LoopProduct-link').contains('КЛЛАРИОН Низкий столик').should('be.visible', 'be.enabled').click();
        cy.get('.summary > .cart > .product-button-wrapper > .single_add_to_cart_button').should('be.visible', 'be.enabled').click();
        cy.wait(7000)
        cy.get('.woocommerce-mini-cart__buttons > [href="https://sh3910517.c.had.su/cart/"]').should('be.visible', 'be.enabled').click();
        cy.wait(7000)
        cy.visit('https://sh3910517.c.had.su/checkout/');
       

        cy.get('.woocommerce-billing-fields').should('be.visible', 'be.disabled')
        cy.get('#billing_first_name').should('be.visible', 'be.enabled').type('Александр');
        cy.get('#billing_last_name').should('be.visible', 'be.enabled').type('Лидрик');
        cy.get('#billing_company').should('be.visible', 'be.enabled').type('Яндекс');     
        cy.get('#select2-billing_country-container').should('be.visible', 'be.enabled').type('Россия').should('be.visible', 'be.enabled').click();
        cy.get('#billing_country_field > .woocommerce-input-wrapper > .select2 > .selection > .select2-selection > .select2-selection__arrow').should('be.visible', 'be.enabled');
        cy.get('#billing_address_1').should('be.visible', 'be.enabled').type('Невский проспект,дом 3');
        cy.get('#billing_address_2').should('be.visible', 'be.enabled').type('квартира 15,этаж 3');
        cy.get('#billing_city_field > label').should('be.visible').contains('Населённый пункт *');
        cy.get('#billing_city').should('be.visible', 'be.enabled').type('Санкт-Петербург');
        cy.get('#billing_state').should('be.visible', 'be.enabled').type('Владимирский Центральный район');
        cy.get('#billing_postcode').type('191186');
        cy.get('#billing_phone').should('be.visible', 'be.enabled').type('+79832477661');
        cy.get('#billing_email').should('be.visible', 'be.enabled').type('el_sashko@mail.ru');
        cy.get('.shop_table').should('be.visible');
        cy.get('td.product-name').should('be.hidden');
        cy.get('.woocommerce-form__label').should('be.visible', 'be.enabled').click().click()
        cy.get('#order_comments').should('be.visible', 'be.enabled').type('Пожалуйста будьте аккуратней во время доставки');
       
      
        cy.get('strong > .woocommerce-Price-amount > bdi').should('be.visible').contains('47,800');
        cy.get('.wc_payment_method').should('be.visible');
        cy.get('.payment_box > p').should('be.visible').contains('Оплата наличными при доставке заказа');
        cy.get('.elementor-section').should('be.visible','be.enabled').contains('Подтвердить заказ').click();


        cy.get('.woocommerce-order').should('be.visible');
        cy.get('.woocommerce-notice').should('be.visible').contains('Ваш заказ принят. Благодарим вас.');
        })
    })
