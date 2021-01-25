import LandRequest from '../database/models/landRequest'

export const addData = async (data) => {
  const newRealEstate = new LandRequest({
    name: data.name,
    symbol: data.symbol,
    images: data.images,
    details: data.details,
    sqftArea: data.sqftArea,
    pricePerSqft: data.pricePerSqft,
    type: data.type,
    rent: data.rent,
    amountStaked: data.amountStaked,
    votes: data.votes,
    minimumAmountCreation: data.minimumAmountCreation,
    org: data.org,
    link: data.link,
    createdAt: Date.now()
  })

  await newRealEstate.save()
  return { sucess: true }
}

export const editData = async (data) => {
  const marketData = await LandRequest.findOne({ name: data.name, owner: data.owner })
  if(marketData){
    marketData.set('tokenId', data.tokenId || marketData.tokenId)
    marketData.set('name', data.name || marketData.name)
    marketData.set('symbol', data.symbol || marketData.symbol)
    marketData.set('images', data.images || marketData.images)
    marketData.set('details', data.details || marketData.details)
    marketData.set('sqftArea', data.sqftArea || marketData.sqftArea)
    marketData.set('pricePerSqft', data.pricePerSqft || marketData.pricePerSqft)
    marketData.set('type', data.type || marketData.type)
    marketData.set('rent', data.rent || marketData.rent)
    marketData.set('amountStaked', data.amountStaked || marketData.amountStaked)
    marketData.set('votes', data.votes || marketData.votes)
    marketData.set('minimumAmountCreation', data.minimumAmountCreation || marketData.minimumAmountCreation)
    marketData.set('org', data.org || marketData.org)
    marketData.set('link', data.link || marketData.link)

    await marketData.save()
    return { sucess: true }
  }

  return { error: "Property Not Found" }
}

export const deleteData = async (data) => {
  const marketData = await LandRequest.findOne({ tokenId: data.tokenId })
  if(marketData){
    await LandRequest.deleteOne({ _id: marketData })
    return{ sucess: true }
  }

  return { error: "Property Not Found" }
}

export const getData = async (data) => {
  try{
    const marketData = await LandRequest.findOne({
      tokenId: data.tokenId
    })

    return marketData || {}
  } catch(e){
    console.log(e)
  }
}

export const getEntireProperty = async () => {
  const marketData = await LandRequest.find({})

  return marketData
}

