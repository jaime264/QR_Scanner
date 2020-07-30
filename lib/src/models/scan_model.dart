class ScanModel {
    int id;
    String tipo;
    String valor;

    ScanModel({
        this.id,
        this.tipo,
        this.valor,
    }){
<<<<<<< HEAD
      if(this.tipo.contains('http')){
=======
      if(this.valor.contains('http')){
>>>>>>> af00403122c7b19df6f672b2f2be9a5471476535
        this.tipo = 'http';
      }else{
        this.tipo = 'geo';
      }
    }

    factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
    };
}
