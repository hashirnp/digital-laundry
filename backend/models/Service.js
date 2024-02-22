const mongoose = require('mongoose');

const serviceSchema = new mongoose.Schema({
  name: { type: String, required: true, unique: true },
  description: { type: String, required: true },
  price: { type: Number, required: true },
  processingTime: { type: Number, required: true }, // In hours or days
  imageUrl: { type: String }, // URL for service image
  // id: { type: String, required: true, unique: true }, // Unique ID for service reference

  // Add other relevant fields as needed, e.g., category, tags
}, {
  timestamps: true,
},);
const Service=mongoose.model('Service', serviceSchema);
module.exports = Service;
