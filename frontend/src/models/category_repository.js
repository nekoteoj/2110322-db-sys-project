import api from "./api_manager";

class CategoryRepository {
  getById(id) {
    return api.get("/category", { id });
  }
}

export default new CategoryRepository();
