import gql from "graphql-tag";

export const SITE_INFO = gql`
query getSite
      {
        site{
          name
          description
        }
}
`;
