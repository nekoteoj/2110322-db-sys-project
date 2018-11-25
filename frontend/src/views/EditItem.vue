<template>
  <div class="edit-item">
    <NavBar/>
    <md-card class="content">
      <div class="md-layout md-title"><span class="title-collapse">Edit {{name}}</span></div>
      <form class="md-layout" @submit.prevent="onConfirmClick">
        <md-field>
          <label>Item name:</label>
          <md-input v-model="item.product_name"></md-input>
        </md-field>
        <md-field>
          <label>Item brand:</label>
          <md-input v-model="item.product_brand"></md-input>
        </md-field>
        <md-field>
          <label>Item category: </label>
          <md-select v-model="item.category_id" name="category" id="category">
            <md-option v-for="category in categories" :key="category.id" :value="category.id" > {{category.name}} </md-option>
          </md-select>
        </md-field>
        <md-field>
          <label>Item description:</label>
          <md-textarea v-model="item.description"></md-textarea>
        </md-field>
        <md-field>
          <label>Item supplier:</label>
          <md-input v-model="item.supplier"></md-input>
        </md-field>
        <md-field>
          <label>Item price:</label>
          <md-input v-model="item.price"></md-input>
        </md-field>
        <md-field>
          <label>Item quantity:</label>
          <md-input v-model="item.quantity"></md-input>
        </md-field>
        <div class="md-layout">
          <div class="md-layout-item md-medium-size-80 md-small-size-80">
            <md-field>
              <label>Image URL:</label>
              <md-input v-model="image"></md-input>
            </md-field>
          </div>
          <div class="md-layout-item md-medium-size-20 md-small-size-20">
            <md-button class="md-raised" @click="addImage">Add</md-button>
          </div>
          <div class="md-layout-item md-medium-size-100 md-small-size-100">
            <md-table v-if="images">
              <md-table-row v-for="(image, index) in images" :key="index">
                <md-table-cell class="title image-table">
                  <a :href="image" target="_blank">{{image}}</a>
                </md-table-cell>
                <md-table-cell>
                  <md-button class="md-dense md-accent" @click="removeImage(index)">
                    Remove
                  </md-button>
                </md-table-cell>
              </md-table-row>
            </md-table>
          </div>
          <div class="md-layout-item">
            <md-button class="md-raised" to="/">Back to list</md-button>
            <md-button type="submit" class="md-raised md-primary right"> Edit item</md-button>
          </div>
        </div>
    </form>
    </md-card>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar";
import itemRepository from "@/models/item_repository";
import categoryRepository from "@/models/category_repository";
import { authData } from "@/models/auth";

export default {
  name: "edit-item",
  props: ["id"],
  data: function() {
    return {
      categories: [],
      item: {
        id: "",
        product_name: "",
        product_brand: "",
        category_id: "",
        description: "",
        supplier: "",
        price: "",
        quantity: "",
        seller_ssn: ""
      },
      images: [],
      image: "",
      name: "Item"
    };
  },
  methods: {
    onConfirmClick() {
      itemRepository
        .editItem({
          images: this.images.join("|||"),
          ...this.item
        })
        .then(() => this.$router.push({ name: "home" }))
        .catch(err => console.log(err));
    },
    addImage() {
      this.images.push(this.image);
      this.image = "";
    },
    removeImage(index) {
      this.images.splice(index, 1);
    }
  },
  created: function() {
    const ssn = authData().ssn;
    this.item.seller_ssn = ssn;
    categoryRepository
      .getAll()
      .then(res => {
        this.categories = res.data;
      })
      .then(() => itemRepository.getById(this.id))
      .then(res => {
        this.images = res.data.images;
        delete res.data.images;
        this.item = res.data;
        this.name = res.data.product_name;
      })
      .catch(err => {
        console.log(err);
      });
    console.log(this.categories);
  },
  components: {
    NavBar
  }
};
</script>

<style scoped>
.content {
  max-width: 500px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 30px;
  margin-bottom: 30px;
  padding: 20px;
}

.title {
  overflow: scroll;
  text-overflow: ellipsis;
}

.title-collapse {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

.image-table {
  max-width: 200px;
}

.right {
  float: right;
}
</style>
