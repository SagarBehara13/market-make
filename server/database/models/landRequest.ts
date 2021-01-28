import { Document, Schema, model } from 'mongoose'

export interface IMarketData {
  tokenId: string,
  name: string,
  symbol: string,
  imageUrl: string,
  details: string,
  sqftArea: number,
  pricePerSqft: number,
  valutAddress: string,
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
  tokenId: String,
  name: String,
  symbol: String,
  imageUrl: String,
  details: String,
  sqftArea: Number,
  pricePerSqft: Number,
  valutAddress: String,
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
