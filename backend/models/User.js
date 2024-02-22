const mongoose = require('mongoose');

const userSchema = new mongoose.Schema({
  // Common user attributes
  fullName: { type: String, required: true },
  email: { type: String, required: true, unique: true },
  password: { type: String, required: true }, // Hash passwords securely
  phone: { type: String },
  address: { type: String }, // Consider adding separate fields for detailed address
  role: { type: String, required: true, enum: ['user', 'staff'] }, // Enum for user types

  // Specific attributes based on role
  orders: [{ type: mongoose.Schema.Types.ObjectId, ref: 'Order' }], // Reference to associated orders

  // Add other relevant fields as needed
}, {
  timestamps: true,
},);

const User = mongoose.model('User', userSchema)
module.exports = User