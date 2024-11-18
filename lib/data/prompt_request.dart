String getRandomItinerary(numDestination,leaveMonth,returnMonth, minDays, maxDays) {
  return '''
    Generate the travel itineraries with super detail including location for each activity, food, entertainment, festivals, accommodation, and more for $numDestination different destinations around the world from $leaveMonth to $returnMonth. 
    Each destination should spend around $minDays to $maxDays days. Make sure to fill all the gaps and don't include transport time like flights or trains from one destination to another.
    Show the frist destination.

    Here’s a exmaple of the structured **daily itinerary format** that incorporates everything into a cohesive plan from check-in to check-out in each destination and follow the detail at above:

    ---
    ### **Travel Itinerary (Daily Plan)**  
    ---
    #### **Day 1: Arrival & Local Exploration**  
    - **Morning**:  
      - **Activity**: Arrival and hotel check-in  
      - **Details**:  
        - **Hotel**: [Hotel Name], [Address]  
        - **Price**: [ Price/Night]  
        - **Amenities**: [Wi-Fi, Breakfast, Pool, etc.]  

    - **Afternoon**:  
      - **Activity**: Visit [Nearby Landmark/Place]  
      - **Details**:  
        - **Location**: [Address]  
        - **Entry Fee**: [Free/Amount]  
        - **Time Required**: [1–2 hours]  
        - **Notes**: [Photography allowed, etc.]  

    - **Evening**:  
      - **Activity**: Dinner at [Restaurant Name]  
      - **Details**:  
        - **Cuisine**: [Cuisine Type, e.g., Italian, Local]  
        - **Location**: [Address]  
        - **Price**: [ Price Range]  

    ---
    #### **Day 2: Sightseeing and Activities**  
    - **Morning**:  
      - **Activity**: Explore [Major Attraction/Place]  
      - **Details**:  
        - **Location**: [Address]  
        - **Entry Fee**: [Free/Amount]  
        - **Time Required**: [3–4 hours]  

    - **Lunch**:  
      - **Restaurant**: [Name and Address]  
      - **Dish to Try**: [Dish Name]  
      - **Price**: [ Price Range]  

    - **Afternoon**:  
      - **Activity**: Adventure Activity/Entertainment  
      - **Details**:  
        - **Name**: [Activity, e.g., Snorkeling, Hiking, or Festival Visit]  
        - **Location**: [Address]  
        - **Price**: [Amount]  
        - **Time Required**: [2–3 hours]  

    - **Evening**:  
      - **Activity**: Shopping or Night Walk  
      - **Details**:  
        - **Location**: [Market/Street Name, Address]  
        - **Recommended Purchases**: [Local Handicrafts, etc.]  

    - **Dinner**:  
      - **Restaurant**: [Name and Address]  
      - **Specialty Dish**: [Dish Name]  

    ---
    #### **Day 3: Final Day & Departure**  
    - **Morning**:  
      - **Activity**: Relax at the hotel or visit [Nearby Attraction]  
      - **Details**:  
        - **Location**: [Address]  
        - **Entry Fee**: [Free/Amount]  

    - **Checkout**:  
      - **Hotel**: [Hotel Name]  
      - **Checkout Time**: [Time]  

    - **Afternoon**:  
      - **Activity**: Airport/Train/Bus Transfer  
      - **Details**:  
        - **Mode of Transport**: [Private Taxi, Shuttle, etc.]  
        - **Price**: [ Amount]  
        - **Duration**: [Time Required]  

    ---
    ''';
}
