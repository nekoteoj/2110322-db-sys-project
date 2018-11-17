<template>
  <div id="item-card" @click="showItem()">
    <md-card md-with-hover>
      <md-card-area>
        <md-card-media class="md-card-bg">
          <img class="item-img" :src="images[index]" alt="Item Image">
        </md-card-media>

        <md-card-header>
          <div class="title" :title="item.product_name">{{ item.product_name }}</div>
          <div class="md-subhead">&#3647; {{ item.price }}</div>
        </md-card-header>

        <md-card-actions>
          <md-button class="md-icon-button md-dense" aria-label="Edit" @click.stop="editItem()"><md-icon>edit</md-icon></md-button>
          <md-button class="md-icon-button md-dense" aria-label="Delete" @click.stop="active = true"><md-icon >delete</md-icon></md-button>
        </md-card-actions>
      </md-card-area>
    </md-card>
    <md-dialog-confirm
      :md-active.sync="active"
      md-title="Delete Item?"
      :md-content="`${item.product_name} will be deleted.`"
      @md-confirm="onDeleteConfirm()"/>
  </div>
</template>

<script>
import itemRepository from "@/models/item_repository";

export default {
  props: ["item"],
  data: function() {
    return {
      images: [require("@/assets/img/no-img.png")],
      handle: 0,
      index: 0,
      active: false
    };
  },
  methods: {
    showItem() {
      this.$router.push(`/show-item/${this.item.id}`);
    },
    editItem() {
      this.$router.push(`/edit-item/${this.item.id}`);
    },
    onDeleteConfirm() {
      itemRepository
        .deleteById(this.item.id)
        .then(() => {
          this.$emit("deleted", this.item);
        })
        .catch(err => {
          console.log(err);
        });
    }
  },
  created: function() {
    this.handle = setInterval(() => {
      if (this.images.length >= 0) {
        this.index = (this.index + 1) % this.images.length;
      }
    }, 2000);
  },
  beforeDestroy: function() {
    clearInterval(this.handle);
  },
  mounted: function() {
    if (this.item.images.length !== 0) {
      this.images = this.item.images;
    }
  }
};
</script>

<style scoped>
#item-card {
  min-width: 200px;
  max-width: 200px;
}

.item-img {
  display: block;
  height: 125px;
  width: auto;
  margin: auto;
}

.md-card-bg {
  background-color: lightgray;
}

.title {
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
