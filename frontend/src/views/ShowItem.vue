<template>
  <div class="show-item">
    <NavBar/>
    <md-card class="content">
      <div class="md-layout">
        <div class="md-layout-item md-small-size-100" id="col-container">
          <Carousel :per-page="1" :loop="true" :mouse-drag="false" :navigationEnabled="true" :autoplay="true" :centerMode="true">
            <Slide v-for="(image, index) in images" :key="index">
              <img class="item-img" :src="image" alt="Item Image">
            </Slide>
          </Carousel>
        </div>
        <div class="md-layout-item md-small-size-100 col-container">
          <md-table>
            <md-table-toolbar>
              <h1 class="md-title">Product Information</h1>
            </md-table-toolbar>
            <md-table-row>
              <md-table-cell>Name</md-table-cell>
              <md-table-cell>{{ item.product_name }}</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Brand</md-table-cell>
              <md-table-cell>{{ item.product_brand }}</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Category</md-table-cell>
              <md-table-cell>{{ category.name }}</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Description</md-table-cell>
              <md-table-cell>{{ item.description }}</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Supplier</md-table-cell>
              <md-table-cell>{{ item.supplier }}</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Price</md-table-cell>
              <md-table-cell>&#3647; {{ item.price }}</md-table-cell>
            </md-table-row>
            <md-table-row>
              <md-table-cell>Quantity</md-table-cell>
              <md-table-cell>{{ item.quantity }}</md-table-cell>
            </md-table-row>
          </md-table>
          <md-button class="right md-raised md-primary" :to="`/edit-item/${id}`">Edit</md-button>
          <md-button class="right md-raised" to="/">Back to list</md-button>
        </div>
      </div>
    </md-card>
  </div>
</template>

<script>
import NavBar from "@/components/NavBar";
import itemRepository from "@/models/item_repository";
import categoryRepository from "@/models/category_repository";
import { Carousel, Slide } from "vue-carousel";

export default {
  name: "show-item",
  components: {
    NavBar,
    Carousel,
    Slide
  },
  props: ["id"],
  data: function() {
    return {
      item: {},
      images: [require("@/assets/img/no-img.png")],
      category: {}
    };
  },
  created: function() {
    itemRepository
      .getById(this.id)
      .then(res => {
        this.item = res.data;
        if (res.data.images.length !== 0) {
          this.images = res.data.images;
        }
      })
      .then(() => categoryRepository.getById(this.item.category_id))
      .then(res => {
        this.category = res.data;
      })
      .catch(err => console.log(err));
  }
};
</script>

<style scoped>
.content {
  margin-left: auto;
  margin-right: auto;
  margin-top: 30px;
  background-color: white;
  padding: 20px;
  max-width: 1024px;
  margin-bottom: 30px;
}

.item-img {
  max-height: 300px;
  margin-left: auto;
  margin-right: auto;
  display: block;
}

#col-container {
  padding: 30px;
}

.right {
  float: right;
}
</style>
