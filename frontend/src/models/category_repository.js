import api from "./api_manager";

class CategoryRepository {

  getAll() {
    return api.get("/category/all", {}, true);
  }

  getById(id) {
    return api.get("/category", { id });
  }
}

export default new CategoryRepository();
