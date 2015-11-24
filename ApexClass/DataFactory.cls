@isTest
public class {{ class_name }} extends DataFactory 
{
  public {{ class_name }}() 
  {
    super();
  }

  /**
   * Implement this method to inform the base class of the SObject 
   * (custom or standard) to be created
   * 
   **/
  public Schema.SObjectType getSObjectType()
  {
    return {{ object_name }}.sObjectType;
  }


  /**
   * Implement this method to set any default values in the
   * test records
   * 
   */
  public void setDefaults()
  {
    //setField('Field_Name__c','Value');
  }


  /**
   * Override this method to update the value in any field
   * to include the value of the incremental number
   * e.g. setField('Name','Customer Name ' + String.valueOf(i))
   *
   * @param  i [incremental number]
   */
  public override void incrementRecords(Integer i)
  {
    if(shouldNotIncrement) return;
  }


  /**
   * Create a set of records
   * Override if there is a need to loop over a set of related records
   * e.g. OpportunityFactory would override so it can loop through
   *      a list of Accounts and set the AccountId field for each batch of
   *      Opportunity records created.
   *
   *      public override void createRecords(Integer numOfRecords)
   *      {
   *        for(Account objAccount : lstAccounts)
   *        {
   *          setField('AccountId', objAccount.Id);
   *          castRecords(numOfRecords);
   *        }
   *      }
   *      
   * @param  numOfRecords [number of records to create]
   */
  public override void createRecords(Integer numOfRecords) 
  {
    castRecords(numOfRecords);
  }


  /**
   * Return a list of the opportunity records
   * @return SObject[]
   */
  public SObject[] get(Set<Id> setIds)
  {
    return new {{ selector_name }}().selectById(setIds);
  }


  //Basic record creation tests 


  
  @isTest public static void testCreatingOneRecord()
  {
    //test code here
    {{ class_name }} factory = new {{ class_name }}();
    {{ object_name }}[] lstRecords = factory.save(1);

    system.assertEquals(1, lstRecords.size());
  }


  @isTest public static void testCreatingBulkRecords()
  {
    //test code here
    {{ class_name }} factory = new {{ class_name }}();
    {{ object_name }}[] lstRecords = factory.save(200);

    system.assertEquals(200, lstRecords.size());
  }
}