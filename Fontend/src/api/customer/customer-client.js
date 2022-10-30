import HttpClient from "../base/http-client";

export default class CustomerClient extends HttpClient{
    constructor(){
        super("Customer");
    }
}
