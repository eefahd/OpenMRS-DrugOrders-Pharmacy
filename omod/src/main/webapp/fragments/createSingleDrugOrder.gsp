<%
    ui.includeCss("drugorders", "drugorders.css")
%>
<!--
    Fragment displaying a form to create an individual drug order.
    This form provides fields to enter all the drug order specifications including drug formulations and consumption instructions.
    The form notifies the Physician if the Patient is allergic to the drug or if there is an active order for the drug.
-->

<div id="createOrderWindow" class="dialog">
    
    <form id="createOrderForm" method="post">

        <div class="dialog-header">
            <span id="dialog-heading"><h3 name="action" id="orderType"></h3></span>
        </div><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Drug name <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="text" id="drugName" oninput="autoCompleteDrug('${ currentOrders }','${ allergicDrugs }')" name="drugName" />
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Start Date <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                ${ ui.includeFragment("uicommons", "field/datetimepicker", [ id: 'startDate', label: '', formFieldName: 'startDate', useTime: '', defaultDate: startDate ]) }
            </div>
        </div>

        <br/><br/><br/>
        
        <!--
            Display a note if an active order for the selected drug exists.
        -->
                
        <div id="orderExists">
            <div class="fields" id="view_order_detail">
                <label>Note: Patient is currently prescribed this drug.</label>
                <label>Cannot place multiple orders for the same drug.</label>
            </div><br/>
        </div>
        
        <!--
            Display a note if Patient is allergic to the drug.
            Display a field to enter the reason to order the allergic drug.
        -->
                
        <div id="allergicReason">
            <div class="fields" id="view_order_detail">
                <label>Note: The patient is allergic to this drug.</label>
                <label>Enter the reasons for ordering this drug:</label>
                <input type="textarea" maxlength="255" id="orderReason" name="orderReason" />
            </div><br/>
        </div>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Route <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="route" name="route">
                    <option value="">Choose option</option>
                    <% routes.each { route -> %>
                        <option value="${ route.getDisplayString() }">${ route.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <br/><br/>

        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="number" id="dose" name="dose" step="0.1" min="0" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Dose units <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="doseUnits" name="doseUnits">
                    <option value="">Choose option</option>
                    <% doses.each { dose -> %>
                        <option value="${ dose.getDisplayString() }">${ dose.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Quantity <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="number" id="quantity" name="quantity" step="0.1" min="0" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Qnty units <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="quantityUnits" name="quantityUnits">
                    <option value="">Choose option</option>
                    <% quantities.each { quantity -> %>
                        <option value="${ quantity.getDisplayString() }">${ quantity.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Duration <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="number" id="duration" name="duration" min="0" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Durn units <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="durationUnits" name="durationUnits">
                    <option value="">Choose option</option>
                    <% durations.each { duration -> %>
                        <option value="${ duration.getDisplayString() }">${ duration.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Frequency <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="frequency" name="frequency">
                    <option value="">Choose option</option>
                    <% frequencies.each { frequency -> %>
                        <option value="${ frequency.getConcept().getDisplayString() }">${ frequency.getConcept().getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>
        
        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Diagnosis <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <input type="text" id="diagnosis" name="diagnosis" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Priority <span id="asterisk">*</span></label>
            </div>
            <div id="order_value">
                <select id="priority" name="priority">
                    <% priorities.each { priority -> %>
                        <option value="${ priority.getDisplayString() }">${ priority.getDisplayString() }</option>
                    <% } %>
                </select>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Refills </label>
            </div>
            <div id="order_value">
                <input type="number" id="refill" name="refill" value="0" min="0" />
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Interval (days)</label>
            </div>
            <div id="order_value">
                <input type="number" id="interval" name="interval" value="0" min="0" />
            </div>
        </div>
        
        <br/><br/><br/>
        
        <div class="fields" id="view_order_detail">
            <label>Instructions from the Physician for -</label>
        </div>  
            
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Patient</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="255" id="patientInstrn" name="patientInstrn"/>
            </div>
        </div>

        <br/><br/>
        
        <div class="fields" id="view_order_detail">
            <div id="order_label">
                <label>Pharmacist</label>
            </div>
            <div id="order_value">
                <input type="textarea" maxlength="255" id="pharmacistInstrn" name="pharmacistInstrn"/>
            </div>
        </div>

        <br/><br/><br/>
        
        <input type="hidden" id="orderAction" name="action" />
        <input type="hidden" id="orderId" name="orderId" />
        
        <div class="fields" id="view_order_detail">
            <div id="addOrderButtonWrapper"><div id="overlay" onclick="checkFormFields()"></div><button class="confirm right" id="addOrderButton" type="submit">${ ui.message("Save") }</button></div>
            <button class="cancel" type="button" onclick="hideIndividualOrderDetailsWindow()">${ ui.message("Cancel") }</button>
        </div><br/>
        
    </form>
</div>


<script type="text/javascript">    
    jq( function() {
        jq( "#drugName" ).autocomplete({
            source: function( request, response ) {
                var results = [];
                jq.getJSON('${ ui.actionLink("getDrugNameSuggestions") }',
                    {
                      'query': request.term, 
                    })
                .success(function(data) {
                    for (index in data) {
                        var item = data[index];
                        results.push(item.name.toUpperCase());
                        }
                    response( results );
                })
                .error(function(xhr, status, err) {
                    alert('AJAX error ' + err);
                });
            },
            response: function(event, ui) {
                if (ui.content.length === 0) {
                    alert("No drugs found! Cannot place order!");
                }
            }
        } ),
      
        jq( "#diagnosis" ).autocomplete({
            source: function( request, response ) {
                var results = [];
                jq.getJSON('${ ui.actionLink("getDiseaseNameSuggestions") }',
                    {
                      'query': request.term, 
                    })
                .success(function(data) {
                    for (index in data) {
                        var item = data[index];
                        results.push(item.name.toUpperCase());
                        }
                    response( results );
                })
               .error(function(xhr, status, err) {
                    alert('AJAX error ' + err);
                });
            },
            response: function(event, ui) {
                if (ui.content.length === 0) {
                    alert("No diagnosis found! Cannot place order!");
                }
            }
        } )
  });
</script>