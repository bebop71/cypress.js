describe('Авторизация', function () {
    it('Правильный логин,правильный пароль' , function () {
        cy.clearCookies()
        cy.visit('https://login.qa.studio/');
         cy.get('#mail').type('german@dolnikov.ru');
         cy.get('#pass').type('iLoveqastudio1');
         cy.get('#loginButton').click()
         cy.contains('Авторизация прошла успешно').should('be.visible');
         cy.get('#exitMessageButton > .exitIcon').should('be.visible').click()
        })
    
    it('Забыли пароль' , function () {
            cy.clearCookies()
            cy.visit('https://login.qa.studio/');
            cy.get('#forgotEmailButton').should('be.visible').click();
            cy.contains('Восстановите пароль').should('be.visible');
            cy.get('#mailForgot').should('be.visible').click()
            cy.get('#mailForgot').type('el_sashko@mail.ru');
            cy.get('#restoreEmailButton').should('be.visible','be.enabled').click()
            cy.contains('Успешно отправили пароль на e-mail').should('be.visible');
            cy.get('#exitMessageButton > .exitIcon').should('be.visible').click()
           }) 
    it('Правильный логин,НЕправильный пароль' , function () {
            cy.clearCookies()
            cy.visit('https://login.qa.studio/');
            cy.get('#mail').type('german@dolnikov.ru');
            cy.get('#pass').type('iLoveqastudio123');
            cy.get('#loginButton').should('be.visible').click()
            cy.contains('Такого логина или пароля нет').should('be.visible');
            cy.get('#exitMessageButton > .exitIcon').should('be.visible').click()
           }) 
    it('НЕправильный логин,правильный пароль' , function () {
            cy.clearCookies()
            cy.visit('https://login.qa.studio/');
            cy.get('#mail').type('german@dolnikovvvvv.ru');
            cy.get('#pass').type('iLoveqastudio1');
            cy.get('#loginButton').should('be.visible').click()
            cy.contains('Такого логина или пароля нет').should('be.visible');
            cy.get('#exitMessageButton > .exitIcon').should('be.visible').click()
           }) 
    it('Валидация' , function () {
            cy.clearCookies()
            cy.visit('https://login.qa.studio/');
            cy.get('#mail').type('germandolnikovru');
            cy.get('#pass').type('iLoveqastudio1');
            cy.get('#loginButton').should('be.visible').click()
            cy.contains('Нужно исправить проблему валидации').should('be.visible');
            cy.get('#exitMessageButton > .exitIcon').should('be.visible').click()
           })
    it('Строчные буквы в логине' , function () {
            cy.clearCookies()
            cy.visit('https://login.qa.studio/');
            cy.get('#mail').type('GerMan@Dolnikov.ru');
            cy.get('#pass').type('iLoveqastudio1');
            cy.get('#loginButton').should('be.visible').click()
            cy.contains('Такого логина или пароля нет').should('be.visible');
            cy.get('#exitMessageButton > .exitIcon').should('be.visible').click()
           })          
    })    
  
