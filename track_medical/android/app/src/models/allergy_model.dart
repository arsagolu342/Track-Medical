class Allergy {
    Allergy({
        this.name,
        this.description,
    });

    String name;
    String description;

    factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        name: json["name"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
    };
}
