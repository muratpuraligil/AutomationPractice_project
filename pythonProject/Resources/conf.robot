*** Variables ***
${email}    4d52dd023b@firemailbox.club   #https://www.mohmal.com/tr  den mail üretilirek email parametresi elle girilir. #not: diğer değişkenler conf.robot dosyası içindedir...
${Browser}  Firefox   # Chrome & Firefox

${homepage}  http://automationpractice.com/
${signin}  class=login
${signin_page_title}    Login - My Store
${email_element}  id=email_create
${submit}   id=SubmitCreate
${gender:mr}  id_gender1
${firstname}  id=customer_firstname
${lastname}  id=customer_lastname
${pass}  id=passwd
${adress}  id=address1
${city}  id=city
${state}  id=id_state
${postcode}  id=postcode
${phone_mobile}  id=phone_mobile
${adress2}  id=alias
${personal_info_submit}  id=submitAccount
${success_info}  Welcome to your account. Here you can manage all of your personal information and orders.

# 2.Scenario_Keywords..............
${dressesMenu}  xpath=(//a[@title='Dresses'])[2]
${summerdresses-link}  xpath=(//a[@title='Summer Dresses'])[2]
${summerdresses-text}  class=cat-name
${product1-cart}   xpath=(//div[@class='product-container'])[2]
${product1-Addcart}   xpath=(//a[contains(@class,'cart_button')])[2]
${product1-price}  class=ajax_block_products_total
${proceedtocheckout}  xpath=//a[@title='Proceed to checkout']
${searchquery}  id=search_query_top
${searchbutton}  xpath=(//button[@type='submit'])[1]
${product1-class-price}  xpath=(//div[@class='content_price'])[4]
${product1-img}   xpath=(//img[contains(@class,'replace-2x')])[2]
${product2-cart}  xpath=(//li//div[@class='product-container'])[1]
${product2-Addcart}   xpath=(//a[contains(@class,'cart_button')])[1]
${product2-price}  id=layer_cart_product_price
${sepet_icon}  xpath=//a[@title='View my shopping cart']
${cart-checkout}  xpath=//a[@title='Check out']
${summary-price-product1}  xpath=(//span[contains(@class,'price')])[5]
${summary-price-product2}  xpath=//span[contains(@class,'special-price')]
${proceedtocheckout_all}  xpath=(//a[@title='Proceed to checkout'])[2]
${adress_selection-proceed}  xpath=//*[@id="center_column"]/form/p/button
${shipp-agree}  xpath=//*[@id="form"]/div/p[2]/label
${shipp_selection_proceed}  xpath=//*[@id="form"]/p/button
${hook_payment}  xpath=//*[@id="HOOK_PAYMENT"]/div[2]/div/p
${checkpayment-text}  class=page-subheading
${IconfirmMyOrderbutton}  xpath=//*[@id="cart_navigation"]/button
${order-complete}  xpath=//*[@id="center_column"]/p[1]
${username-menulink}   class=account
${OrderhistoryAndDetails}  class=icon-list-ol
${order_status_element}  class=history_state

*** Keywords ***
Open Automationpractice website
    Open browser  ${homepage}  ${Browser}
    Maximize Browser Window
    go to  ${homepage}
click to signin
    Wait Until Element Is Visible  ${signin}  10
    click element  ${signin}
verify the login screen
    Title Should Be   ${signin_page_title}
enter your email address
    input text   ${email_element}   ${email}
click to create an account
    click button    ${submit}
enter in member informations
    Wait Until Page Contains Element   ${gender:mr}  10  #title
    click element   ${gender:mr}  #title
    input text   ${firstname}  ad
    input text   ${lastname}  soyad
    input text   ${pass}   passwd
    input text   ${adress}    1111sok.No:6-D:6-Maltepe
    input text   ${city}  istanbul
    Select From List By Index  ${state}  2
    input text   ${postcode}  33333
    input text   ${phone_mobile}  5554443322
    input text   ${adress2}  1111sok.No:6-D:6-Maltepe
Click to register
    click button  ${personal_info_submit}
Verify Successful Registration
    page should Contain   ${success_info}

#Sipariş Oluşturma - keyword'leri...
Open The Summer Dresses page
    mouse over  ${dressesMenu}  #Dresses menüsü
    Wait Until Element Is Visible  ${summerdresses-link}   15
    click element  ${summerdresses-link}  #Summer dresses
    Wait Until Page Contains Element  ${summerdresses-text}   10
verify the summer dresses screen
    Title Should Be  Summer Dresses - My Store
adding products & verification
    Wait Until Page Contains Element  ${product1-img}    10
    click element  ${product1-class-price}
    click element   ${product1-Addcart}   #Add to Cart
    Wait Until Element Is Visible   ${product1-price}  10
    ${ürün1_price} =  get text  ${product1-price}
    Wait Until Element Is Visible   ${proceedtocheckout}    10
    click element   ${proceedtocheckout}  # 1.ürün sepete eklendi...
    input text   ${searchquery}  summer  #Arama sonrası sepete ekleme
    Wait Until Element Is Visible  ${searchbutton}
    click button  ${searchbutton}  #arama iconu
    Wait Until Element Is Visible  ${product1-img}    15
    mouse over  ${product2-cart}
    click element  ${product2-Addcart}     #Add to Cart
    Wait Until Element Is Visible  ${product2-price}  10
    ${ürün2_price} =  get text  ${product2-price}
    Wait Until Element Is Visible   ${proceedtocheckout}  10
    click element   ${proceedtocheckout}
    mouse over  ${sepet_icon}
    Wait Until Element Is Visible  ${cart-checkout}  15
    click element   ${cart-checkout}
    Wait Until Element Is Visible  ${summary-price-product1}    15
    ${product1_price_verify} =  get text   ${summary-price-product1}  #1.ürün fiyatını al
    should be equal   ${ürün1_price}   ${product1_price_verify}       #1.ürün fiyatı sepete eklenen ürün fiyatı ile aynı mı? Doğrula...
    ${product2_price_verify} =  get text   ${summary-price-product2}    #2.ürün fiyatını al
    should be equal   ${ürün2_price}   ${product2_price_verify}         #2.ürün fiyatı sepete eklenen ürün fiyatı ile aynı mı? Doğrula...
    Wait Until Element Is Visible  ${proceedtocheckout_all}   15
    click element  ${proceedtocheckout_all}
Address Selection
    click element  ${adress_selection-proceed}
Shipping Selection
    Wait Until Element Is Visible   ${shipp-agree}  10
    click element   ${shipp-agree}    #I agree
    Wait Until Element Is Visible  ${shipp_selection_proceed}  10
    click element  ${shipp_selection_proceed}
Payment Selection
    click element  ${hook_payment}    #pay by check
    Wait Until Element Is Visible   ${checkpayment-text}    10
Click I confirm my order the button
    click element  ${IconfirmMyOrderbutton}    # I confirm my order
    Title Should Be   Order confirmation - My Store  # verify the screen
    Wait Until Element Is Visible  ${order-complete}    10  #Your order on My Store is complete.
Verify Successful Order & Details
    click element  ${username-menulink}    #Kullanıcı Adı tıkla
    click element  ${OrderhistoryAndDetails}    #Order history and details tıkla
    Title Should Be   Order history - My Store  # verify the screen
    ${order_status} =  get text  ${order_status_element}
    should be equal  ${order_status}  On backorder