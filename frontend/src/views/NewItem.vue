<template>
  <div class="new-item">
    <NavBar/>
    <h1>This is New Page</h1>
    <form class="md-layout" @submit.prevent="onConfirmClick">
<md-field>
      <label>Item name:</label>
      <md-input v-model="item.name" placeholder="type item's name here"></md-input>
    </md-field>
<md-field>
      <label>Item brand:</label>
      <md-input v-model="item.brand" placeholder="type item's brand here"></md-input>
    </md-field>
        <md-field>
          <label>Item category: </label>
          <md-select v-model="item.category" name="category" id="category">
            <md-option v-for="category in categories" :key="category.id" :value="category.id" > {{category.name}} </md-option>
          </md-select>
        </md-field>
<md-field>
      <label>Item description:</label>
      <md-textarea v-model="item.description" placeholder="type item's description here"></md-textarea>
    </md-field>
<md-field>
      <label>Item supplier:</label>
      <md-input v-model="item.supplier" placeholder="type item's supplier here"></md-input>
    </md-field>
<md-field>
      <label>Item price:</label>
      <md-input v-model="item.price" placeholder="type item's price here"></md-input>
    </md-field>
<md-field>
      <label>Item quantity:</label>
      <md-input v-model="item.quantity" placeholder="type item's quantity here"></md-input>
    </md-field>
    </form>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar";
import itemRepository from "@/models/item_repository";
import categoryRepository from "@/models/category_repository";

export default {
  name: "new-item",
  data: function() {
    return {
      categories: [],
      item: {
        name: "",
        brand: "",
        category: "",
        description: "",
        supplier: "",
        price: "",
        quantity: "",
      }
    };
  },
  methods: {
    onConfirmClick() {
      //
    }
  },
  created: function() {
    categoryRepository
      .getAll()
      .then(res => {
        this.categories = res.data;
console.log("Hello world");
console.log(res);
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
