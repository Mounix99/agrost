enum CollectionsNaming { users, fields, sections, plants, stages }

extension CollectionsNamingSerializer on CollectionsNaming {
  String serialize() {
    switch (this) {
      case CollectionsNaming.users:
        return 'Users';
      case CollectionsNaming.fields:
        return 'Fields';
      case CollectionsNaming.sections:
        return 'Sections';
      case CollectionsNaming.plants:
        return 'Plants';
      case CollectionsNaming.stages:
        return 'Stages';
    }
  }
}
