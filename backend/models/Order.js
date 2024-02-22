const mongoose = require('mongoose');

const orderSchema = new mongoose.Schema({
  userId: { type: mongoose.Schema.Types.ObjectId, ref: 'User', required: true }, // Reference to customer
  serviceId: { type: mongoose.Schema.Types.ObjectId, ref: 'Service', required: true }, // Reference to service
  datePlaced: { type: Date, default: Date.now },
  pickupDate: { type: Date },
  deliveryDate: { type: Date },
  deliveryAddress: { type: String }, // Consider adding separate fields for detailed address
  status: { type: String, required: true, enum: ['pending', 'processing', 'completed', 'cancelled'] },
  price: { type: Number, required: true }, // Order total price
  paymentStatus: { type: String, enum: ['unpaid', 'paid'] }, // Track payment status
  coupon: { type: mongoose.Schema.Types.ObjectId, ref: 'Coupon' }, // Reference to applied coupon (if any)

  // Add other relevant fields as needed, e.g., special instructions, delivery notes
}, {
  timestamps: true,
},);
const Order = mongoose.model('Order', orderSchema);
module.exports = Order;
