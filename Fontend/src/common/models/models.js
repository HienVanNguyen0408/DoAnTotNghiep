function User() {
    let user = {
        "userId": "CA32F0CC-7EE9-464E-AFC0-AE741A14CF76",
        "userName": "",
        "password": "",
        "email": "",
        "fullName": "",
        "phoneNumber": "",
        "typeLogin": 1,
        "age": 0,
        "levelEnglish": 0,
        "role": 1,
        "createdDate": null,
        "modifiedDate": null
    };
    return user;
}
function Question() {
    let question = {
        "questionId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "textQuestion": "",
        "pathImage": "",
        "pathAudio": "",
        "pathVideo": "",
        "examForm": 1,
        "levelQuestionId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "result": "",
        "createdDate": null,
        "modifiedDate": null,
        "isListen": false,
        "numberListen": 0,
        "typeQuestionId": "",
        "typeQuestionName": "",
        "levelName": ""
    };
    return question;
}
function LevelQuestion() {
    let level = {
        "levelQuestionId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "levelName": "",
        "levelNumber": 0,
        "createdDate": null,
        "modifiedDate": null
    };
    return level;
}

function TypeQuestion() {
    let type = {
        "typeQuestionId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "typeQuestionName": "",
        "typeDescription": "",
        "createdDate": null,
        "modifiedDate": null
      }
    return type;
}

function ProductCategory() {
    let productCategory = {
        "productCategoryId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "productCategoryName": "",
        "productCategoryDescription": "",
        "productCategoryImage": ""
    };
    return productCategory;
}

function Product() {
    let product = {
        "productId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "productCategoryId": null,
        "productName": "",
        "productDimensions": "",
        "productMaterial": "",
        "productManufacturer": "",
        "productColor": null,
        "productOriginalPrice": 0,
        "productSalePrice": 0,
        "productDescriptionShort": "",
        "productDescription": "",
        "productEvaluate": 5,
        "productImage": ""
    };
    return product;
}

function OrderDetail1() {
    let orderDetail = {
        "orderId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "productId": "1253c55e-11ef-47d2-939c-f8af2ab5b43e",
        "amount": ""
    };
    return orderDetail;
}

function Order() {
    let order = {
        "orderId": "",
        "userName": "",
        "phoneNumber": "",
        "statusOrder": 5,
    };
    return order;
}

function News() {
    let news = {
        "newsId": "1253c55e-11ef-47d2-939c-f8af2ab5b47e",
        "newsTitle": "",
        "newsContent": "",
        "linkImage": "",
        "newsHot": "",
        "newsProduct": "",
        "newSale": "",
        "newsEvent": ""
    };
    return news;
}
export { User,Question, LevelQuestion, TypeQuestion, ProductCategory, Product, OrderDetail1, Order, News }