const mongoose = require('mongoose');

const couponSchema = new mongoose.Schema({
  code: { type: String, required: true, unique: true },
  discount: { type: Number, required: true }, // Discount percentage or amount
  expirationDate: { type: Number },
  usageLimit: { type: Number }, // Maximum number of times the coupon can be used
  active: { type: Boolean, default: true }, // Flag to control coupon availability
  minimumOM: {type: Number, required: true}
  // Add other relevant fields as needed, e.g., minimum order amount, applicable services/users
}, {
  timestamps: true,
},);
const Coupon = mongoose.model('Coupon', couponSchema);
module.exports = Coupon;
