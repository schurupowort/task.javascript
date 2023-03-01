class Product {
    constructor(name, price, quantity, description) {
      this.name = name;
      this.price = price;
      this.quantity = quantity;
      this.description = description;
    }
}


class Condition{
    constructor(name, operator, value){
        this.name = name;
        this.operator = operator;
        this.value = value;
    }

    getfieldvalue(product){
        switch(this.name){
            case 'name': 
                return product.name;
            case 'price': 
                return product.price;
            case 'quantity': 
                return product.quantity;
            case 'description': 
                return product.description;
        }
    }

    check(product){
        let value = this.getfieldvalue(product)
        switch(this.operator){
            case 'contains': 
                return value.includes(this.value)
            case 'starts': 
                return value.startsWith(this.value)
            case 'ends': 
                return value.endsWith(this.value)
            case '<': 
                return value < Number(this.value) 
            case '=': 
                return value == Number(this.value)
            case '>': 
                return value > Number(this.value) 
            case '<=': 
                return value <= Number(this.value)
            case '>=': 
                return value >= Number(this.value)
        }
    }
}


function parseCondition(raw_condition){
    let rawConditions = raw_condition.split('&');
    let conditions = rawConditions.map(splitCondition);
    return conditions;
}


function splitCondition(raw_condition){
    let readyCondion = raw_condition.split('-');
    if(readyCondion.length == 3) {
        return new Condition(readyCondion[0], readyCondion[1], readyCondion[2]);
    }
    else {
        let slice_point = 1;
        if(readyCondion[1].includes(">=") || readyCondion[1].includes("<=")) {
            slice_point = 2;
        }

        let operator = readyCondion[1].slice(0, slice_point);
        let value = readyCondion[1].slice(slice_point);
        return new Condition(readyCondion[0], operator, value);
    }
}


function checkProduct(productlist, raw_condition){
    let conditions = parseCondition(raw_condition); 
    let filtrProd = [];
    for (let product of productlist){
        let resultcondition = conditions.reduce(
            (accumulator, current) => (accumulator && current.check(product)),
            true
        );
        if (resultcondition == true){
            filtrProd.push(product);
        }
    }
    return filtrProd;

}


let productlist = [
    new Product("milk", 50, 100, "milk product"),
    new Product("bred", 23, 50, "bakery product"),
    new Product("sausages", 100, 80, "meat product"),
    new Product("afds", 2, 80, "meat productabc")
];

let condition = "name-contains-fd&price-=2&quantity->5&description-ends-abc";

console.log(checkProduct(productlist, condition))