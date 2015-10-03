/**
 * See https://github.com/financialforcedev/fflib-apex-common for more info
 *
 * Install library via 
 *   https://githubsfdeploy.herokuapp.com/app/githubdeploy/financialforcedev/fflib-apex-common
 */

/**
 * Class encapsulates query logic for {{ object_name }}
 *
 * https://developer.salesforce.com/page/Apex_Enterprise_Patterns_-_Selector_Layer
 **/
public class {{ api_name }} extends fflib_SObjectSelector
{
	public List<Schema.SObjectField> getSObjectFieldList()
	{
		return new List<Schema.SObjectField> {
				{{ object_name }}.Id
			};
	}

	public Schema.SObjectType getSObjectType()
	{
		return {{ object_name }}.sObjectType;
	}

	public List<{{ object_name }}> selectById(Set<ID> idSet)
	{
		return (List<{{ object_name }}>) selectSObjectsById(idSet);
	}	

	/*
	 * For more examples see https://github.com/financialforcedev/fflib-apex-common-samplecode
	 *
	 * 
	public List<{{ object_name }}> selectBySomethingElse(Set<Id> setIds)
	{
	  fflib_QueryFactory queryFactory = newQueryFactory();
    String strQuery = queryFactory.setCondition('Id IN :setIds').
                                   toSOQL();
    return (List<{{ object_name }}>) Database.query(strQuery);
	}

	public List<{{ object_name }}> selectBySomethingElse(Set<Id> setIds)
	{
	  fflib_QueryFactory queryFactory = newQueryFactory();
		
		//add subselect values
	  fflib_QueryFactory subSelectQueryFactory = new SObjectSelector().addQueryFactorySubselect(queryFactory);
    
		//add parent record fields (can use more than one)
		new AccountsSelector().configureQueryFactoryFields(queryFactory, 'Account');
		new UsersSelector().configureQueryFactoryFields(subSelectQueryFactory, 'User');

    String strQuery = queryFactory.setCondition('Id IN :setIds AND IsActive = true').
                                   toSOQL();
    return (List<{{ object_name }}>) Database.query(strQuery);
	}



	public List<{{ object_name }}> selectBySomethingElse(List<String> somethings)
	{
		assertIsAccessible();
		return (List<{{ object_name }}>) Database.query(
				String.format(
				'select {0}, ' +
				  'from {1} ' +
				  'where Something__c in :somethings ' + 
				  'order by {2}',
				new List<String> {
					getFieldListString(),
					getSObjectName(),
					getOrderBy() } ) );
	}
	 */
}
