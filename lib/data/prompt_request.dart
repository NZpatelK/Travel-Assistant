String getRandomItinerary(
    numDestination, leaveMonth, returnMonth, minDays, maxDays, budget) {
  return '''
   Generate detailed travel itineraries including specific locations for each activity, food options, entertainment, festivals, accommodation, and more for $numDestination different destinations around the world from $leaveMonth to $returnMonth. 
Each destination should have a stay duration of approximately $minDays to $maxDays days. The budget for the entire trip, including all $numDestination destinations, should be around $budget. Ensure that all time gaps are accounted for, including transport times such as flights or trains between destinations. 
Start by showing the first destination.

Here’s an example of a structured **daily itinerary format** that incorporates everything into a cohesive plan, covering check-in to check-out for each destination and following the details outlined above:

Here is a well-structured travel itinerary template that includes all the mentioned elements. Travelers can input specific details based on their destination and the number of days spent there. please show one destination at time. show the $numDestination itinerary.

---
${getItinerary()}
    ''';
}

String getRandomOptions(
    numDestination, leaveMonth, returnMonth, minDays, maxDays, budget) {
  return '''
      Generate list of options of place,food,accomdate, transport, etc for $numDestination different destinations around the world. The Budget should be around $budget for whole trip include $numDestination destinations. The trip should be around $minDays to $maxDays days per desination.
      The trip should travel period between $leaveMonth to $returnMonth. 
      Show the frist destination.

      here the example of list of option structure. 
      Here’s a structured format for a comprehensive list of options for each destination, ensuring that it covers all aspects like accommodation, activities, food, transport, and more.  Please remove bracket ([])

---

${getListOfOptions()}

      ''';
}

String getCustomItinerary(destination, country, daysMin, daysMax,
    numDestination, budget, totalDestination) {
  return '''
  Generate the travel itineraries with super detail including location for each activity, food, entertainment, festivals, accommodation, and more for $destination, $country. The Budget should be around $budget for whole trip include $totalDestination destinations. 
  Each destination should spend around $daysMin to $daysMax days. Make sure to fill all the gaps and include transport time like flights or trains from one destination to another.
  ---
  Desination $numDestination

  ---

  ${getItinerary()}

  ''';
}

String getCustomOption(destination, country, daysMin, daysMax, numDestination,
    budget, totalDestination) {
  return '''
  Generate list of options of place,food,accomdate, transport, etc for $destination, $country for $daysMin to $daysMax days. The Budget should be around $budget for whole trip include $totalDestination destinations.  The trip should be around $daysMin to $daysMax.
  ---
  Desination $numDestination
  ---
  ${getListOfOptions()}
  ''';
}

String getItinerary() {
  return '''
  
  ## **Travel Itinerary**

### **Overview**
- **Number of Destinations**:  
- **Days Spent**:
- **Special Notes**:  

---

### **Destination [Number]: [Destination Name, Country Name]**  

#### **Day [Number]**  
- **Breakfast**:  
  - **Place**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Morning Activity**:  
  - **Activity Name**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Lunch**:  
  - **Place/Type of Food**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Afternoon Activity**:  
  - **Activity/Place Name**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Evening Activity**:  
  - **Activity/Place Name**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Dinner**:  
  - **Place/Type of Food**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Accommodation**:  
  - **Name**:  
  - **Location**:  
  - **Price (per night)**:  

---

### **Transportation**  
- **Mode of Transport**:  
- **Pickup Location**:  
- **Drop-off Location**:  
- **Price**:  
- **Duration**:  

---

### **Additional Activities and Hidden Gems**  
- **Hidden Gem Name**:  
  - **Location**:  
  - **Price**:  
  - **Time to Spend**:  
- **Festival/Event**:  
  - **Name**:  
  - **Location**:  
  - **Price**:  
  - **Duration**:  

---

### **Special Notes / Warnings / Recommendations**  
- **Cultural Sensitivities**:  
- **Weather/Clothing Tips**:  
- **Safety Warnings**:  
- **Required Documentation**:  
- **Important Contacts**:  

---

###**Total Budget/Cost** 
- **Budget/Cost**:

Repeat the above structure for each destination, updating the numbers and details accordingly.
      ''';
}

String getListOfOptions() {
  return '''
 ### **Destination [Number]: [Destination Name], [Country]**

---

#### **1. Places to Visit**

- **Name:** [Attraction Name]  
  **Location:** [Exact Address/Area]  
  **Type:** [Park/Museum]  
  **Entry Fee:** \$XX  
  **Best Time to Visit:** [Season/Time of Day]  
  **Time to Spend:** X hours  
  **Notes:** [Guides available/Other tips]  

---

#### **2. Activities**

- **Activity:** [Name of Activity]  
  **Location:** [Exact Address/Area]  
  **Type:** [Outdoor/Indoor]  
  **Price:** \$XX  
  **Best Time:** [Season/Time of Day]  
  **Duration:** X hours  
  **Notes:** [Special packages/Equipment provided]  

---

#### **4. Hidden Gems**

- **Name:** [Hidden Spot Name]  
  **Location:** [Exact Address/Area]  
  **Description:** [Unique Features]  
  **Entry Fee:** \$XX  
  **Best Time to Visit:** [Season/Time of Day]  
  **Time to Spend:** X hours  
  **Notes:** [Accessibility info]  

---

#### **5. Food Options**

- **Meal Type:** Breakfast  
  **Name:** [Name of Place]  
  **Location:** [Exact Area]  
  **Cuisine:** [Local/Continental]  
  **Price Range:** \$XX - \$XX  
  **Popular Dishes:** [Signature Dish]  
  **Notes:** [Vegetarian options, etc.]  

- **Meal Type:** Lunch  
  **Name:** [Name of Place]  
  **Location:** [Exact Area]  
  **Cuisine:** [Local/Continental]  
  **Price Range:** \$XX - \$XX  
  **Popular Dishes:** [Signature Dish]  
  **Notes:** [Vegetarian options, etc.]  

- **Meal Type:** Dinner  
  **Name:** [Name of Place]  
  **Location:** [Exact Area]  
  **Cuisine:** [Local/Continental]  
  **Price Range:** \$XX - \$XX  
  **Popular Dishes:** [Signature Dish]  
  **Notes:** [Vegetarian options, etc.]  

---

#### **6. Transportation**

- **Type:** [Mode: Bus/Taxi]  
  **Operator:** [Name of Operator]  
  **Route/Area Covered:** [Area/Route]  
  **Price:** \$XX - \$XX  
  **Availability:** [Frequency/On-call]  
  **Notes:** [Booking info]  

---

#### **7. Festivals and Entertainment**

- **Event Name:** [Festival Name]  
  **Location:** [Exact Address/Area]  
  **Type:** [Cultural/Art]  
  **Dates:** [Dates of Event]  
  **Entry Fee:** \$XX  
  **Notes:** [Special performances]  

---

#### **8. Other**

- **Category:** [Shopping/Spas/other stuff]  
  **Details:** [Name/Details]  
  **Location:** [Exact Area]  
  **Price:** \$XX - \$XX  
  **Notes:** [Recommendations]  

---

### **Total Eismate Budget/ Cost**
- **Budget/Cost:** \$XX

This structure ensures easy comparison and detailed insights into what each destination offers. Let me know if you'd like me to populate this for a specific destination!
  ''';
}
