import api from "./api_manager";

class ItemRepository {
  getById(id) {
    return api.get("/item", { id });
  }

  getBySeller(ssn) {
    return api.get("/seller/items", { ssn }, true);
  }

  createItem(data) {
    return api.post("/item", data, true);
  }

  editItem(data) {
    return api.put("/item", data, true);
  }

  deleteById(id) {
    return api.delete("/item", { id }, true);
  }
}

export default new ItemRepository();
