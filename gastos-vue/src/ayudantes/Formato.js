export default {
    formatearMoneda(cantidad){
        let val = (cantidad / 1).toFixed(2).replace(',', '.')
        return '$ ' + val.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ")
    }
}