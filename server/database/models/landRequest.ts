import { Document, Schema, model } from 'mongoose'

export interface IMarketData {
  tokenId: number,
  name: string,
  symbol: string,
  imageUrl: string,
  details: string,
  sqftArea: number,
  pricePerSqft: number,
  type: string,
  rent: number,
  amountStaked: number,
  votes: number,
  minimumAmountCreation: number,
  org: string,
  link: string,
  createdAt: Date
}

const MarketDataSchema = new Schema({
  tokenId: Number,
  name: String,
  symbol: String,
  imageUrl: String,
  details: String,
  sqftArea: Number,
  pricePerSqft: Number,
  type: String,
  rent: Number,
  amountStaked: Number,
  votes: Number,
  minimumAmountCreation: Number,
  org: String,
  link: String,
  createdAt: Date
})

export type LandRequest = Document & IMarketData
export default model<LandRequest>('LandRequest', MarketDataSchema)
