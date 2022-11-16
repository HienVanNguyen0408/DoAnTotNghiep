import HttpClient from "../base/http-client";

export default class ProductClient extends HttpClient{
    constructor(){
        super("Product");
    }
}
